module Codebreaker
  class Game
    include Validator
    include Errors
    SECRET_CODE_SIZE = 4
    SECRET_CODE_RANGE = (1..6).freeze
    WIN_COMBINATION = '++++'.freeze
    WIN_GAME_STATUS = :win
    LOSE_GAME_STATUS = :lose
    IN_GAME_STATUS = :game
    attr_reader :secret_code, :hints, :hint_number, :attempts, :max_attempts, :status, :player, :result, :difficulty

    def initialize(player, difficulty)
      @difficulty = Difficulty.new(difficulty)
      @attempts = @difficulty.attempts
      @hints = @difficulty.hints
      @secret_code = generate_secret_code
      @hint_number = @secret_code.clone
      @status = IN_GAME_STATUS
      @player = player
    end

    def guess(answer)
      @attempts -= 1
      @result = Guess.new(answer, @secret_code).check_guess
      @status = check_game_status
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

    private

    def generate_secret_code
      Array.new(SECRET_CODE_SIZE) { rand(SECRET_CODE_RANGE) }
    end

    def check_game_status
      if @attempts.zero? then LOSE_GAME_STATUS
      elsif @result == WIN_COMBINATION then WIN_GAME_STATUS
      else IN_GAME_STATUS
      end
    end
  end
end
