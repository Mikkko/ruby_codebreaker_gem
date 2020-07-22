module Codebreaker
  class Game
    include Validator
    include Errors
    SECRET_SIZE = 4
    SECRET_RANGE = (1..6).freeze
    RIGHT_ANSWER_SYMBOL = '+'.freeze
    WRONG_ANSWER_SYMBOL = '-'.freeze
    WIN_COMBINATION = '++++'.freeze
    WIN_GAME_STATUS = :win
    LOSE_GAME_STATUS = :lose
    IN_GAME_STATUS = :game
    attr_accessor :secret, :hints, :hint_number, :attempts, :max_attempts, :status, :player, :result

    def initialize(player, difficulty)
      @difficulty = Difficulty.new(difficulty)
      @attempts = @difficulty.attempts
      @hints = @difficulty.hints
      @secret_code = generate_secret_code
      @status = IN_GAME_STATUS
      @player = player
      @hint_number = @secret_code.clone
    end

    def guess(answer)
      validate_guess(answer)
      answer = break_number(answer)
      @attempts -= 1
      check_guess(answer)
      @status = check_status
      @result
    end

    def hint
      raise HintError if @hints.zero?

      @hints -= 1
      random_index = rand(@hint_number.size)
      number = @hint_number[random_index]
      @hint_number.delete_at(random_index)
      number
    end

    def self.show_statistic(file)
      Statistic.new(file).sort_stats
    end

    def save_result(file)
      statistic = Statistic.new(file)
      hash = create_statistic
      statistic.store_statistic(hash)
    end

    private

    def check_guess(answer)
      @result = WRONG_ANSWER_SYMBOL * (@secret_code & answer).map { |element| [@secret_code.count(element), answer.count(element)].min }.sum
      answer.each_with_index { |element, index| @result.sub!(WRONG_ANSWER_SYMBOL, RIGHT_ANSWER_SYMBOL) if element == @secret_code[index] }
    end

    def validate_guess(answer)
      validate_argument_type(answer, Integer)
      validate_length(answer, SECRET_SIZE)
      validate_range(answer, SECRET_RANGE)
    end

    def generate_secret_code
      Array.new(SECRET_SIZE) { rand(SECRET_RANGE) }
    end

    def check_status
      if @attempts.zero? then LOSE_GAME_STATUS
      elsif @result == WIN_COMBINATION then WIN_GAME_STATUS
      else IN_GAME_STATUS
      end
    end

    def break_number(number)
      number.to_s.scan(/./).map(&:to_i)
    end

    def create_statistic
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
