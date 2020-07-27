RSpec.describe Codebreaker::Guess do
  let(:guess_object) { described_class.new(1234, [1, 1, 1, 1]) }

  describe '.validate' do
    it 'raise WrongArgumentError if guess is not integer' do
      expect { described_class.validate('guess') }.to raise_error(Codebreaker::Errors::WrongArgumentError)
    end

    it 'raise LengthError if guess is not equal to SECRET_CODE_SIZE' do
      expect { described_class.validate(1_234_567_890) }.to raise_error(Codebreaker::Errors::LengthError)
    end
  end
end
