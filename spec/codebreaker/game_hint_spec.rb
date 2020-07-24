RSpec.describe Codebreaker::Game do
  let(:game) { described_class.new(Codebreaker::Player.new('Mikkko'), 'easy') }

  describe '#hint' do
    it 'raise HintError if hints are absent' do
      game.instance_variable_set(:@hints, 0)
      expect { game.hint }.to raise_error(Codebreaker::Errors::HintError)
    end

    it 'reduces hint counter by 1' do
      expect { game.hint }.to change(game, :hints).by(-1)
    end

    it 'returns integer' do
      expect(game.hint.class).to eq(Integer)
    end

    it 'reduces hint_number size by 1' do
      expect { game.hint }.to change { game.hint_number.size }.by(-1)
    end

    it 'returns number included in secret_code' do
      expect(game.secret_code).to include(game.hint)
    end
  end
end
