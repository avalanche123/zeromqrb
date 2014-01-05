module ZeroMQ
  module Errors
    ERRORS = Errno.constants.map(&Errno.method(:const_get)).
             inject({}) { |map, error| map[error.const_get(:Errno)] = error; map }

    private

    def check_result!(rc)
      return rc if ZMQ::Util.resultcode_ok?(rc)
      raise ERRORS.fetch(ZMQ::Util.errno) { ZMQ::Util.error_string }
    end
  end
end
