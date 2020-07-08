module Codebreaker
  class Game
    include Validator
    attr_accessor :secret, :hints, :answer, :attempts, :status, :player

    def initialize(_player, difficulty)
      @secret = create_secret
      difficulty_changer(difficulty)
      @status = :game
    end

    def guess(answer)
      check_status
      validate_guess(answer)
      @attempts -= 1
    end

    private

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
    end

    def create_secret
      secret = []
      4.times { secret << rand(1..6) }
      secret
    end

    def change_difficulty(hints, attempts)
      @hints = hints
      @attempts = attempts
    end

    def check_status
      if @attempts.zero?
        @status = :lose
      elsif @result == '++++'
        @status = :win
      end
    end

    def break_number(number)
      number.to_s.scan(/./).map(&:to_i)
    end
  end
end
