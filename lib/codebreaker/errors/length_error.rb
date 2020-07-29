module Codebreaker
  module Errors
    class LengthError < StandardError
      def initialize(message = 'Argument length is not correct. ')
        super(message)
      end
    end
  end
end
