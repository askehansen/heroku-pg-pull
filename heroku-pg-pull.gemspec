# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'heroku/pg/pull/version'

Gem::Specification.new do |spec|
  spec.name          = "heroku-pg-pull"
  spec.version       = Heroku::Pg::Pull::VERSION
  spec.authors       = ["Aske Hansen"]
  spec.email         = ["aske@deeco.dk"]

  spec.summary       = "Pull a postgres backup from heroku and replace the current database"
  spec.homepage      = "https://github.com/askehansen/heroku-pg-pull"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
