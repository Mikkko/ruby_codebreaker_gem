RSpec.describe Codebreaker::Statistic do
  let(:player) { Codebreaker::Player.new('Mikkko') }
  let(:game) { Codebreaker::Game.new(player, 'easy') }

  hash = {
    player: 'Mikkko',
    difficulty: :easy,
    attempts: 15,
    attempts_used: 5,
    hints: 2,
    hints_used: 2
  }

  describe '#store_statistic' do
    let(:statistic) { described_class.new('results.yml') }
    it 'creates file if it does not exist' do
      statistic.store_statistic(hash)
      expect(File.file?('results.yml')).to be(true)
    end
  end

  describe '#load_statistic' do
    after { File.delete('results.yml') }
    it 'returns array if file exists' do
      statistic = described_class.new('results.yml')
      expect(statistic.load_statistic.class).to eq(Array)
    end
  end
end
