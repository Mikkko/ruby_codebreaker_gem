RSpec.describe Codebreaker::Game do
  let(:game) { described_class.new(Codebreaker::Player.new('Mikkko'), 'easy') }

  describe 'guess' do
    it 'reduce attempts by 1' do
      expect { game.guess(1111) }.to change(game, :attempts).by(-1)
    end

    it 'returns string' do
      expect(game.guess(1111).class).to eq(String)
    end

    it 'returns result' do
      expect(game.guess(1111)).to eq(game.result)
    end
  end
end
