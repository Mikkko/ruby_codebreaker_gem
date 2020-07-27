module Codebreaker
  class Guess
    include Validator
    RIGHT_ANSWER_SYMBOL = '+'.freeze
    WRONG_ANSWER_SYMBOL = '-'.freeze
    SECRET_CODE_SIZE = 4
    SECRET_CODE_RANGE = (1..6).freeze
    attr_reader :guess, :secret_code, :result

    def initialize(guess, secret_code)
      @secret_code = secret_code
      @guess = break_number(guess)
    end

    def check_guess
      @result = WRONG_ANSWER_SYMBOL * count_matched_numbers
      @guess.each_with_index do |element, index|
        @result.sub!(WRONG_ANSWER_SYMBOL, RIGHT_ANSWER_SYMBOL) if element == @secret_code[index]
      end
      @result
    end

    def self.validate(guess)
      validate_argument_type(guess, Integer)
      validate_length(guess, SECRET_CODE_SIZE)
      validate_range(guess, SECRET_CODE_RANGE)
    end

    private

    def count_matched_numbers
      (@secret_code & @guess).map { |element| [@secret_code.count(element), @guess.count(element)].min }.sum
    end

    def break_number(number)
      number.to_s.scan(/./).map(&:to_i)
    end
  end
end
