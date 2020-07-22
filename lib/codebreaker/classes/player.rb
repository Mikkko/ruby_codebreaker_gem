module Codebreaker
  class Player
    include Validator
    attr_accessor :name

    NAME_LENGTH = (3..20).freeze

    def initialize(name)
      validate(name)
      @name = name
    end

    private

    def validate(name)
      validate_argument_type(name, String)
      validate_string_length(name, NAME_LENGTH)
    end
  end
end
