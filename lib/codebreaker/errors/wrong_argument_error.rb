module Codebreaker
  module Errors
    class WrongArgumentError < StandardError
      def initialize(message = 'Wrong type argument given')
        super(message)
      end
    end
  end
end
