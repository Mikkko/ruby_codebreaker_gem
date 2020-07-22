RSpec.describe Codebreaker::Game do
  let(:game) { described_class.new(Codebreaker::Player.new('Mikkko'), 'easy') }

  describe '#show_results' do
    it 'returns array if file exists' do
      expect(described_class.show_statistic('results.yml').class).to eq(Array) if File.file?('results.yml')
    end

    it 'raises StatisticFileError if file not found' do
      expect { described_class.show_statistic('file.txt') }.to raise_error(Codebreaker::Errors::StatisticFileError)
    end
  end

  describe '#save_results' do
    after { File.delete('results.yml') }

    it 'creates statistic file if does not exist' do
      game.save_result('results.yml')
      expect(File.file?('results.yml')).to be(true)
    end
  end
end
