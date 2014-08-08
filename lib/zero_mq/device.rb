module ZeroMQ
  class Device
    
    def self.create(frontend, backend, capture=nil)
      new(frontend, backend, capture)
    end
    
    # Starts the built-in ØMQ proxy in the current application thread.
    # 
    # The proxy connects a frontend socket to a backend socket. Conceptually,
    # data flows from frontend to backend. Depending on the socket types,
    # replies may flow in the opposite direction. The direction is conceptual
    # only; the proxy is fully symmetric and there is no technical difference
    # between frontend and backend.
    # 
    # Before calling zmq_proxy() you must set any socket options, and connect
    # or bind both frontend and backend sockets.
    # 
    # If the capture socket is not NULL, the proxy shall send all messages,
    # received on both frontend and backend, to the capture socket. The capture
    # socket should be a ZMQ_PUB, ZMQ_DEALER, ZMQ_PUSH, or ZMQ_PAIR socket.
    # 
    # http://api.zeromq.org/3-2:zmq-proxy
    def initialize(frontend, backend, capture=nil)
      # If objects are of class ZeroMQ::Socket, pull out the ZMQ::Socket
      # object to be passed to ZMQ::Device.
      args = [frontend, backend, capture]
        .map! { |socket| (socket.is_a? ZeroMQ::Socket) ? socket.__getobj__ : socket }
      
      ZMQ::Device.new *args
    end
  end
  
  # Alias for device.
  class Proxy < Device; end
end