module Codebreaker
  module Errors
    class RangeError < StandardError
      def initialize(message = 'One of digits is not in given range. ')
        super(message)
      end
    end
  end
end
