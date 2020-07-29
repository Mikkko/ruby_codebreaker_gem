require 'codebreaker/version'
require 'yaml/store'

require_relative 'codebreaker/errors/statistic_file_error'
require_relative 'codebreaker/errors/difficulty_error'
require_relative 'codebreaker/errors/wrong_argument_error'
require_relative 'codebreaker/errors/length_error'
require_relative 'codebreaker/errors/range_error'
require_relative 'codebreaker/errors/hint_error'
require_relative 'codebreaker/errors/negative_number_error'
require_relative 'codebreaker/errors/wrong_command_error'

require_relative 'codebreaker/modules/validator'

require_relative 'codebreaker/classes/difficulty'
require_relative 'codebreaker/classes/player'
require_relative 'codebreaker/classes/guess'
require_relative 'codebreaker/classes/statistic'
require_relative 'codebreaker/classes/game'

module Codebreaker
end
