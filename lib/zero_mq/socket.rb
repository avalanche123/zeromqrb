module ZeroMQ
  class Socket < ::SimpleDelegator
    include Errors

    [ :bind,         :connect,
      :setsockopt,   :close,
      :send_strings, :send_string,
      :recv_strings, :recv_string
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
