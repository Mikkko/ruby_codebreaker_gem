module Codebreaker
  class Difficulty
    include Validator
    DIFFICULTIES = { easy: { attempts: 15, hints: 2 },
                     medium: { attempts: 10, hints: 1 },
                     hell: { attempts: 5, hints: 1 } }.freeze

    def initialize(difficulty)
      validate_difficulty(difficulty)
      @difficulty = difficulty.to_sym
    end

    def attempts
      DIFFICULTIES[@difficulty][:attempts]
    end

    def hints
      DIFFICULTIES[@difficulty][:hints]
    end
  end
end
