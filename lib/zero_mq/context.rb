module ZeroMQ
  class Context < ::SimpleDelegator
    def initialize(io_threads = 1)
      super(ZMQ::Context.new(io_threads))
    end

    def socket(*args)
      Socket.new(super)
    end
  end
end
