RSpec.describe Codebreaker::Guess do
  describe '#check_guess' do
    [
      [6543, [5, 6, 4, 3], '++--'],
      [6543, [6, 4, 1, 1], '+-'],
      [6543, [6, 5, 4, 4], '+++'],
      [6543, [3, 4, 5, 6], '----'],
      [6543, [6, 6, 6, 6], '+'],
      [6543, [2, 6, 6, 6], '-'],
      [6543, [2, 2, 2, 2], ''],
      [6666, [1, 6, 6, 1], '++'],
      [1234, [3, 1, 2, 4], '+---'],
      [1234, [1, 5, 2, 4], '++-'],
      [1234, [1, 2, 3, 4], '++++']
    ].each do |item|
      it 'returns correct result depends on input' do
        guess = described_class.new(item[0], item[1])
        expect(guess.check_guess).to eq item[2]
      end
    end
  end
end
