RSpec.describe Codebreaker::Difficulty do
  let(:difficulty) { described_class.new('easy') }

  describe '.validate' do
    context 'when given unknown difficulty' do
      it 'raise DifficultyError' do
        expect { described_class.validate('hardveryhard') }.to raise_error(Codebreaker::Errors::DifficultyError)
      end
    end

    context 'when given not string' do
      it 'raise WrongArgumentError' do
        expect { described_class.validate(123) }.to raise_error(Codebreaker::Errors::WrongArgumentError)
      end
    end
  end

  describe '#attempts' do
    it 'return Integer' do
      expect(difficulty.attempts.class).to eq(Integer)
    end
  end

  describe '#hints' do
    it 'return Integer' do
      expect(difficulty.hints.class).to eq(Integer)
    end
  end
end
