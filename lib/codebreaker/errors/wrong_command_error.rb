module Codebreaker
  module Errors
    class WrongCommandError < StandardError
      def initialize(message = 'Wrong command... ')
        super(message)
      end
    end
  end
end
