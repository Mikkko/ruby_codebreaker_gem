RSpec.describe Codebreaker::Game do
  let(:game) { described_class.new(Codebreaker::Player.new('Mikkko'), 'easy') }

  describe '#guess' do
    it 'reduces attempts counter by 1' do
      expect { game.guess(1111) }.to change(game, :attempts).by(-1)
    end

    it 'return string' do
      expect(game.guess(1111).class).to eq String
    end
  end
end
