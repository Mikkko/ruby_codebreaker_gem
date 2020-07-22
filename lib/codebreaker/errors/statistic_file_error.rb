module Codebreaker
  module Errors
    class StatisticFileError < StandardError
      def initialize(message = 'No statistic found...')
        super(message)
      end
    end
  end
end
