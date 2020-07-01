require 'pry'

module Codebreaker
  class Game
    attr_accessor :secret, :hints, :max_attempts, :answer, :attempts, :status

    def initialize
      @secret = []
      @hints = 0
      @attempts = 0
      @answer = ''
    end

    def difficulty(difficulty_name)
      case difficulty_name.to_s.capitalize
      when 'Easy' then change_difficulty(2, 15)
      when 'Medium' then change_difficulty(1, 10)
      when 'Hell' then change_difficulty(1, 5)
      else
        raise ArgumentError, 'Difficulty must be Easy, Medium or Hell'
      end
    end

    private

    def change_difficulty(hints, max_attempts)
      @hints = hints
      @max_attempts = max_attempts
    end
  end
end
