RSpec.describe Codebreaker::Difficulty do
  let(:difficulty) { described_class.new('easy') }

  describe '.initialize' do
    it 'has difficulty instance variable' do
      expect(difficulty.instance_variables).to include(:@difficulty)
    end

    it 'raise DifficultyError if given unknown difficulty' do
      expect { described_class.new('hardveryhard') }.to raise_error(Codebreaker::Errors::DifficultyError)
    end

    it 'raise WrongArgumentError not string' do
      expect { described_class.new(123) }.to raise_error(Codebreaker::Errors::WrongArgumentError)
    end
  end

  describe '.attempts' do
    it 'return Integer' do
      expect(difficulty.attempts.class).to eq(Integer)
    end
  end

  describe '.hints' do
    it 'return Integer' do
      expect(difficulty.hints.class).to eq(Integer)
    end
  end
end
