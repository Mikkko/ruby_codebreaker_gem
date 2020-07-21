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
      group_by_hints.map { |hash| hash.map { |_, result| result.sort_by { |field| field[:attempts_used] } } }.flatten
    end

    def group_by_hints
      group_by_difficulty.flat_map { |_, result| result.group_by { |field| field[:hints_used] } }
    end

    def group_by_difficulty
      stats = @statistic.sort_by { |result| [result[:attempts_total], result[:hints_used]] }
      stats.group_by { |result| result[:difficulty] }
    end
  end
end
