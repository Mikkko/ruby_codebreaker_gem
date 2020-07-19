module Codebreaker
  class Game
    include Store
    include Validator
    SECRET_SIZE = 4
    SECRET_RANGE = (1..6).freeze
    attr_accessor :secret, :hints, :attempts, :max_attempts, :status, :player, :result

    def initialize(player, difficulty)
      difficulty_changer(difficulty)
      @secret = create_secret
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
      @result
    end

    def hint
      if @hints.zero?
        nil
      else
        @hints -= 1
        @secret.sample
      end
    end

    def show_results(file)
      load_data(file)
    end

    def save_result(file)
      hash = to_hash
      store_data(hash, file)
    end

    private

    def check_guess(answer)
      @result = '-' * (@secret & answer).map { |element| [@secret.count(element), answer.count(element)].min }.sum
      answer.each_with_index { |element, index| @result.sub!('-', '+') if element == @secret[index] }
    end

    def difficulty_changer(difficulty_name)
      validate_difficulty(difficulty_name)
      case difficulty_name
      when 'easy' then change_difficulty(:easy, 2, 15)
      when 'medium' then change_difficulty(:medium, 1, 10)
      when 'hell' then change_difficulty(:hell, 1, 5)
      end
    end

    def validate_guess(answer)
      validate_argument_type(answer, Integer)
      validate_length(answer, SECRET_SIZE)
      validate_range(answer, SECRET_RANGE)
    end

    def create_secret
      secret = []
      SECRET_SIZE.times { secret << rand(SECRET_RANGE) }
      secret
    end

    def change_difficulty(difficulty, hints, attempts)
      @difficulty = difficulty
      @hints = hints
      @attempts = attempts
      @max_attempts = attempts
      @max_hints = hints
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

    def to_hash
      attempts_used = @max_attempts - @attempts
      hints_used = @max_hints - @hints
      {
        player: @player,
        difficulty: @difficulty,
        attempts: @max_attempts,
        attempts_used: attempts_used,
        hints: @max_hints,
        hints_used: hints_used
      }
    end
  end
end
