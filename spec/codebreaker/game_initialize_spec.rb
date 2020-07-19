RSpec.describe Codebreaker::Game do
  let(:game) { described_class.new(Codebreaker::Player.new('Mikkko'), 'easy') }
  describe '.initialize' do
    it 'secret is an Array' do
      expect(game.secret.class).to eq Array
    end

    it 'secret size equal to SECRET_SIZE' do
      expect(game.secret.size).to eq described_class::SECRET_SIZE
    end

    it 'each element of secret is in SECRET_RANGE contstant' do
      game.secret.each do |digit|
        expect(described_class::SECRET_RANGE).to include(digit)
      end
    end

    it 'player is instance of Player class' do
      expect(game.player.class).to eq Codebreaker::Player
    end

    it 'game status is :game' do
      expect(game.status).to eq :game
    end
  end
end
