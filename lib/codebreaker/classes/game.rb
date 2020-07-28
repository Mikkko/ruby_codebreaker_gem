module Codebreaker
  class Game
    include Validator
    include Errors
    SECRET_CODE_SIZE = 4
    SECRET_CODE_RANGE = (1..6).freeze
    attr_reader :secret_code, :hints, :hint_number, :attempts, :max_attempts, :player, :result, :difficulty

    def initialize(player, difficulty)
      @difficulty = Difficulty.new(difficulty)
      @attempts = @difficulty.attempts
      @hints = @difficulty.hints
      @secret_code = generate_secret_code
      @hint_number = @secret_code.clone
      @player = player
    end

    def guess(answer)
      @attempts -= 1
      @result = Guess.new(answer, @secret_code).check_guess
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
  end
end
