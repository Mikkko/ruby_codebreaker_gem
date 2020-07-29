module Codebreaker
  class Statistic
    include Errors
    attr_reader :file_path, :game

    def initialize(file_path)
      @file_path = file_path
    end

    def store_statistic(game)
      @game = game
      stats = File.file?(@file_path) && !File.zero?(@file_path) ? load_statistic : []
      stats << create_statistic
      file = File.open(@file_path, 'w')
      file.write(stats.to_yaml)
      file.close
    end

    def sort_stats
      load_statistic.sort_by { |data| [data[:attempts], data[:attempts_used], data[:hints_used]] }
    end

    private

    def load_statistic
      File.file?(@file_path) ? YAML.load_file(@file_path) : raise(StatisticFileError)
    end

    def create_statistic
      attempts_used = @game.difficulty.attempts - @game.attempts
      hints_used = @game.difficulty.hints - @game.hints
      {
        player: @game.player,
        difficulty: @game.difficulty.difficulty,
        attempts: @game.difficulty.attempts,
        attempts_used: attempts_used,
        hints: @game.difficulty.hints,
        hints_used: hints_used
      }
    end
  end
end
