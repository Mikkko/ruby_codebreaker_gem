module Codebreaker
  module Errors
    class HintError < StandardError
      def initialize(message = 'You have used all hints... ')
        super(message)
      end
    end
  end
end
