module Codebreaker
  module Validator
    include Errors
    def validate_argument_type(answer, class_name)
      raise WrongArgumentError until answer.is_a?(class_name)
    end

    def validate_difficulty(difficulty_given)
      difficulty = %w[Easy Medium Hell]
      raise DifficultyError until difficulty.include?(difficulty_given)
    end
  end
end
