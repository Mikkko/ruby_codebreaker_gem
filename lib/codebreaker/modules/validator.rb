module Codebreaker
  module Validator
    include Errors

    def validate_argument_type(argument, class_name)
      raise WrongArgumentError until argument.is_a?(class_name)
    end

    def validate_difficulty_name(difficulty_given, difficulties)
      raise DifficultyError until difficulties.key?(difficulty_given.to_sym)
    end

    def validate_length(argument, length_argument)
      raise LengthError until argument.digits.count == length_argument
    end

    def validate_range(number, range)
      raise RangeError until number.digits.all? { |element| range.cover?(element) }
    end

    def validate_string_length(string, range)
      raise LengthError until range.include?(string.length)
    end

    def validate_is_positive(number)
      raise NegativeNumberError until number.positive?
    end
  end
end
