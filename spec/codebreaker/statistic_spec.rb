RSpec.describe Codebreaker::Statistic do
  describe '#store_statistic' do
    let(:statistic) { described_class.new('results.yml') }
    let(:player) { Codebreaker::Player.new('Mikkko') }
    let(:game) { Codebreaker::Game.new(player, 'easy') }

    it 'creates file if not exist' do
      statistic.store_statistic(game)
      expect(File.file?('results.yml')).to be(true)
    end
  end

  describe '#sort_stats' do
    let(:statistic) { described_class.new('results.yml') }

    after { File.delete('results.yml') }

    it 'returns array if file exists' do
      expect(statistic.sort_stats.class).to eq(Array)
    end
  end

  describe '#load_statistic' do
    let(:fake_statistic) { described_class.new('fake.txt') }

    it 'raises StatisticFileError if file is not exist ' do
      expect { fake_statistic.send(:load_statistic) }.to raise_error(Codebreaker::Errors::StatisticFileError)
    end
  end
end
