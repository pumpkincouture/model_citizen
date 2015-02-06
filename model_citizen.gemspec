# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'model_citizen/version'

Gem::Specification.new do |spec|
  spec.name          = "model_citizen"
  spec.version       = ModelCitizen::VERSION
  spec.authors       = ["Sylwia Olak"]
  spec.email         = ["pumpkincouture@gmail.com"]
  spec.summary       = %q{Provides validation methods for models in the LumberYard Sinatra app and command line application.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "3.1.0"
end
