RSpec.describe Codebreaker::Game do
  describe 'check constans' do
    it 'check SECRET_SIZE constant' do
      expect(described_class::SECRET_SIZE).to eq 4
    end

    it 'check SECRET_RANGE constant' do
      expect(described_class::SECRET_RANGE).to eq (1..6)
    end
  end
end
