RSpec.describe Codebreaker::Game do
  let(:game) { described_class.new(Codebreaker::Player.new('Mikkko'), 'easy') }

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

    it 'game status equal to IN_GAME_STATUS' do
      expect(game.status).to eq(described_class::IN_GAME_STATUS)
    end

    it 'hint_number is equal to secret_code' do
      expect(game.hint_number).to eq(game.secret_code)
    end
  end
end
