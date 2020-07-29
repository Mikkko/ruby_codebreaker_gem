RSpec.describe Codebreaker::Game do
  let(:difficulty) { Codebreaker::Difficulty.new('easy') }
  let(:game) { described_class.new(Codebreaker::Player.new('Mikkko'), difficulty) }

  describe '.initialize' do
    it 'secret is an Array' do
      expect(game.secret_code.class).to eq(Array)
    end

    it 'secret_code size equal to SECRET_CODE_SIZE' do
      expect(game.secret_code.size).to eq(described_class::SECRET_CODE_SIZE)
    end

    it 'each element of secret is in SECRET_CODE_RANGE' do
      game.secret_code.each { |digit| expect(described_class::SECRET_CODE_RANGE).to include(digit) }
    end

    it 'player is instance of Player class' do
      expect(game.player.class).to eq(Codebreaker::Player)
    end

    it 'difficulty is instance of Difficulty class' do
      expect(game.difficulty.class).to eq(Codebreaker::Difficulty)
    end

    it 'hint_number is equal to secret_code' do
      expect(game.hint_number).to eq(game.secret_code)
    end
  end
end
