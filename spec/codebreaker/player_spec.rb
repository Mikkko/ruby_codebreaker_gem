RSpec.describe Codebreaker::Player do
  let(:player) { described_class.new('Mikkko') }

  describe '.initialize' do
    it 'has name field' do
      expect(player.instance_variables).to include(:@name)
    end

    it 'name is string' do
      expect(player.name.class).to eq(String)
    end
  end

  describe '.validate' do
    it 'raises WrongArgumentError' do
      expect { described_class.new(123) }.to raise_error(Codebreaker::Errors::WrongArgumentError)
    end

    it 'raises ClassError' do
      expect { described_class.new('ar') }.to raise_error(Codebreaker::Errors::LengthError)
    end
  end
end
