require_relative 'lib/codebreaker/version'

Gem::Specification.new do |spec|
  spec.name          = "codebreaker"
  spec.version       = Codebreaker::VERSION
  spec.summary       = 'Gem that provide codebreaker game'
  spec.description   = 'Gem which give responsibility to play codebreaker game. It can create random number, parse player answers and make statistic'
  spec.author        = 'Mikkko'
  spec.email         = 'danilzhmak88@gmail.com'
  spec.homepage      = 'https://github.com/Mikkko/ruby_codebreaker_gem'
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.add_development_dependency 'rspec'
end
