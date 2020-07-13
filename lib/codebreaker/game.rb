require 'pry'
module Codebreaker
  SECRET_SIZE = 4
  SECRET_RANGE = (1..6).freeze

  class Game
    include Validator
    attr_accessor :secret, :hints, :attempts, :status, :player, :result

    def initialize(player, difficulty)
      @secret = create_secret
      difficulty_changer(difficulty)
      @status = :game
      @player = player
    end

    def guess(answer)
      validate_guess(answer)
      @result = ''
      answer = break_number(answer)
      @attempts -= 1
      check_guess(answer)
      @status = check_status
    end

    def hint
      if @hints.zero?
        nil
      else
        @hints -= 1
        @secret.sample
      end
    end

    private

    def check_guess(answer)
      positive_answer = answer_positive(answer)
      answer_negative(positive_answer)
    end

    def answer_positive(answer)
      @result = ''
      positive = 0
      answer.each_with_index do |_number, index|
        if answer[index] == @secret[index]
          positive += 1
          answer[index] = '+'
        end
      end
      @result = '+' * positive
      answer
    end

    def answer_negative(answer)
      negative = answer & @secret
      @result << '-' * negative.size
    end

    def difficulty_changer(difficulty_name)
      validate_difficulty(difficulty_name)
      case difficulty_name.to_s.capitalize
      when 'Easy' then change_difficulty(2, 15)
      when 'Medium' then change_difficulty(1, 10)
      when 'Hell' then change_difficulty(1, 5)
      end
    end

    def validate_guess(answer)
      validate_argument_type(answer, Integer)
      validate_length(answer, SECRET_LENGTH)
      validate_range(answer, SECRET_RANGE)
    end

    def create_secret
      secret = []
      SECRET_SIZE.times { secret << rand(SECRET_RANGE) }
      secret
    end

    def change_difficulty(hints, attempts)
      @hints = hints
      @attempts = attempts
    end

    def check_status
      if @attempts.zero? then :lose
      elsif @result == '++++' then :win
      else :game
      end
    end

    def break_number(number)
      number.to_s.scan(/./).map(&:to_i)
    end
  end
end
