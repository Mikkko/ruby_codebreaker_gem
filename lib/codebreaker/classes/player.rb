module Codebreaker
  class Player
    extend Validator
    attr_accessor :name

    NAME_LENGTH = (3..20).freeze

    def initialize(name)
      @name = name
    end

    def self.validate(name)
      validate_argument_type(name, String)
      validate_string_length(name, NAME_LENGTH)
    end
  end
end
