module Codebreaker
  class StatisticSorter
    def initialize(statistic)
      @statistic = statistic
    end

    def stats
      sort_stats.flat_map do |field|
        ["Name: #{field[:player].name}
        Difficulty: #{field[:difficulty]}
        Attempts total: #{field[:attempts]}
        Attempts used: #{field[:attempts_used]}
        Hints total: #{field[:hints]}
        Hints used: #{field[:hints_used]}"]
      end
    end

    private

    def sort_stats
      @statistic.sort_by { |result| [result[:attempts_total], result[:hints_used]] }
    end
  end
end
