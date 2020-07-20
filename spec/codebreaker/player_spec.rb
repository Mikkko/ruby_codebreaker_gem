RSpec.describe Codebreaker::Player do
  let(:player) { described_class.new('Mikkko') }

  describe '.initialize' do
    it 'has name field' do
      expect(player.instance_variables).to include(:@name)
    end

    it 'name is Mikkko' do
      expect(player.name).to eq('Mikkko')
    end
  end
end
