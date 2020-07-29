module Codebreaker
  module Errors
    class NegativeNumberError < StandardError
      def initialize(message = 'Number must be positive! ')
        super(message)
      end
    end
  end
end
