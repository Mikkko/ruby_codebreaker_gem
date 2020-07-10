module Codebreaker
  module Validator
    include Errors
    def validate_argument_type(argument, class_name)
      raise WrongArgumentError until argument.is_a?(class_name)
    end

    def validate_difficulty(difficulty_given)
      difficulty = %w[Easy Medium Hell]
      raise DifficultyError until difficulty.include?(difficulty_given)
    end

    def validate_length(argument, length_argument)
      raise LengthError until argument.digits.count == length_argument
    end

    def validate_range(number, range)
      raise RangeError until number.digits.each { |digit| range.include?(digit) }
    end
  end
end
