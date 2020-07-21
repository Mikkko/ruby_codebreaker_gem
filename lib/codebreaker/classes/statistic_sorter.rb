module Codebreaker
  class StatisticSorter
    def initialize(statistic)
      @statistic = statistic
    end

    def create_table
      sorted_stats.flat_map do |stat|
        ["Name: #{stat[:player].name}\nDifficulty: #{stat[:difficulty]}
Attempts total: #{stat[:attempts]}\nAttempts used: #{stat[:attempts_used]}\nHints total: #{stat[:hints]}
Hints used: #{stat[:hints_used]}"]
      end
    end

    private

    def group_by_difficulty
      stats = @statistic.sort_by { |result| [result[:attempts_total], result[:hints_used]] }
      stats.group_by { |result| result[:difficulty] }
    end

    def group_by_hints
      group_by_difficulty.flat_map { |_, result| result.group_by { |field| field[:hints_used] } }
    end

    def sorted_stats
      group_by_hints.map { |hash| hash.map { |_, result| result.sort_by { |field| field[:attempts_used] } } }.flatten
    end
  end
end
