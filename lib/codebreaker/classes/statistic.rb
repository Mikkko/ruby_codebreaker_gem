module Codebreaker
  class Statistic
    def initialize(file_path)
      @file_path = file_path
    end

    def store_statistic(hash)
      stats = File.file?(@file_path) && !File.zero?(@file_path) ? load_statistic : []
      stats << hash
      file = File.open(@file_path, 'w')
      file.write(stats.to_yaml)
      file.close
    end

    def load_statistic
      File.file?(@file_path) && !File.zero?(@file_path) ? YAML.load_file(@file_path) : []
    end

    def sort_stats
      load_statistic.sort_by { |data| [data[:attempts], data[:attempts_used], data[:hints_used]] }
    end
  end
end
