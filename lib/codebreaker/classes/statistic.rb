module Codebreaker
  class Statistic
    include Errors
    attr_reader :file_path

    def initialize(file_path)
      @file_path = file_path
    end

    def store_statistic(player, difficulty, attempts, hints)
      @player = player, @difficulty = difficulty, @attempts = attempts, @hints = hints
      hash = create_statistic
      stats = File.file?(@file_path) && !File.zero?(@file_path) ? load_statistic : []
      stats << hash
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
      attempts_used = @difficulty.attempts - @attempts
      hints_used = @difficulty.hints - @hints
      {
        player: @player,
        difficulty: @difficulty,
        attempts: @difficulty.attempts,
        attempts_used: attempts_used,
        hints: @difficulty.hints,
        hints_used: hints_used
      }
    end
  end
end
