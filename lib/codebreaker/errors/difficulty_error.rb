module Codebreaker
  module Errors
    class DifficultyError < StandardError
      def initialize(message = 'Unknown difficulty. ')
        super(message)
      end
    end
  end
end
