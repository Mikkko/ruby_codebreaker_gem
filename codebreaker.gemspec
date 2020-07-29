require_relative 'lib/codebreaker/version'

Gem::Specification.new do |spec|
  spec.name          = 'codebreaker'
  spec.version       = Codebreaker::VERSION
  spec.authors       = ['Daniil Zhmak']
  spec.email         = ['danilzhmak88@gmail.com']

  spec.summary       = 'Codebreaker Game'
  spec.description   = 'It can create random number, parse player answers and make statistic'
  spec.homepage      = 'https://github.com/Mikkko/ruby_codebreaker_gem'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.6.3')

  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/Mikkko/ruby_codebreaker_gem'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'fasterer', '~>0.8'
  spec.add_development_dependency 'i18n', '~>1.8'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'rspec', '~> 3.9'
  spec.add_development_dependency 'rubocop', '~>0.87'
  spec.add_development_dependency 'rubocop-faker'
  spec.add_development_dependency 'rubocop-graphql'
  spec.add_development_dependency 'rubocop-performance'
  spec.add_development_dependency 'rubocop-rails'
  spec.add_development_dependency 'rubocop-rspec'
  spec.add_development_dependency 'simplecov', '~>0.18'
end
