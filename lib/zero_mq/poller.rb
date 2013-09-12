module ZeroMQ
  class Poller < ::SimpleDelegator
    include Errors

    def initialize
      super(ZMQ::Poller.new)
    end

    def register(pollable, events = ZMQ::POLLIN | ZMQ::POLLOUT)
      super(pollable.__getobj__, events)
    end

    [ :poll, :poll_nonblock,
      :register_readables, :register_writeables
    ].each do |method|
      class_eval <<-EOF, __FILE__, __LINE__
      def #{method}(*args, &block)
        begin
          check_result! __getobj__.__send__(:#{method}, *args, &block)
        rescue Exception
          $@.delete_if{|s| %r"#{Regexp.quote(__FILE__)}"o =~ s}
          ::Kernel::raise
        end
      end
      EOF
    end
  end
end
