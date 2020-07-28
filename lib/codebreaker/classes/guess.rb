module Codebreaker
  class Guess
    extend Validator
    RIGHT_ANSWER_SYMBOL = '+'.freeze
    WRONG_ANSWER_SYMBOL = '-'.freeze
    SECRET_CODE_SIZE = 4
    SECRET_CODE_RANGE = (1..6).freeze
    attr_reader :guess, :secret_code, :result, :wrong_answer, :right_answer

    def initialize(guess, secret_code)
      @secret_code = secret_code
      @guess = break_number(guess)
    end

    def symbols(right_answer = RIGHT_ANSWER_SYMBOL, wrong_answer = WRONG_ANSWER_SYMBOL)
      @right_answer = right_answer
      @wrong_answer = wrong_answer
    end

    def check_guess
      symbols
      @result = @wrong_answer * count_matched_numbers
      @guess.each_with_index do |element, index|
        @result.sub!(@wrong_answer, @right_answer) if element == @secret_code[index]
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
