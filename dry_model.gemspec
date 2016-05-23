require File.join(File.dirname(__FILE__), "lib", "dry_model", "version")

Gem::Specification.new do |s|
  s.name          = 'dry_model'
  s.license       = 'MIT'
  s.version       = DryModel::VERSION
  s.homepage      = 'https://github.com/victorcreed/dry_model'
  s.authors       = ['Kamal Ejaz']
  s.email         = ['a2ninek@yahoo.com']
  s.description   = 'micro library to dry models'
  s.summary       = 'micro library to dry models'

  s.files         = `git ls-files`.split("\n").sort
  s.test_files    = `git ls-files -- {spec,features}/*`.split("\n")

  s.required_ruby_version = '>= 1.9.3'

  s.add_dependency 'rails',               '>= 3.2', '< 5.0'
end
