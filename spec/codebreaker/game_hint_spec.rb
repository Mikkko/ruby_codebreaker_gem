RSpec.describe Codebreaker::Game do
  let(:game) { described_class.new(Codebreaker::Player.new('Mikkko'), 'easy') }

  describe '#hint' do
    it 'returns integer' do
      expect(game.hint.class).to eq(Integer)
    end

    it 'returns one random number from secret code' do
      expect(game.secret).to include(game.hint)
    end

    it 'reduces hint counter by 1' do
      expect { game.hint }.to change(game, :hints).by(-1)
    end
  end
end
