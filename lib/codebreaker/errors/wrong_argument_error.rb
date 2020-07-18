module Codebreaker
  module Errors
    class WrongArgumentError < StandardError
      def initialize(message = 'Wrong argument given. ')
        super(message)
      end
    end
  end
end
