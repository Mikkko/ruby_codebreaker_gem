RSpec.describe Codebreaker::Game do
  let(:game) { described_class.new(Codebreaker::Player.new('Mikkko'), 'easy') }

  describe '#show_results' do
    it 'returns array if file exists' do
      expect(described_class.show_results('results.yml').class).to eq(Array)
    end
  end

  describe '#save_result' do
    it 'creates file if it does not exist' do
      game.save_result('results.yml')
      expect(File.file?('results.yml')).to be(true)
    end
  end
end
