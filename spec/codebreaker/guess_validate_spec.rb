RSpec.describe Codebreaker::Guess do
  describe '.validate' do
    context 'when guess is not integer' do
      it 'raise WrongArgumentError' do
        expect { described_class.validate('guess') }.to raise_error(Codebreaker::Errors::WrongArgumentError)
      end
    end

    context 'when guess is not equal to SECRET_CODE_SIZE' do
      it 'raise LengthError' do
        expect { described_class.validate(1_234_567_890) }.to raise_error(Codebreaker::Errors::LengthError)
      end
    end

    context 'when guess is not in SECRET_CODE_RANGE' do
      it 'raise RangeError' do
        expect { described_class.validate(9999) }.to raise_error(Codebreaker::Errors::RangeError)
      end
    end
  end
end
