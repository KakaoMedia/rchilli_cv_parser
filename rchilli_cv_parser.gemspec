# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rchilli_cv_parser/version'

Gem::Specification.new do |spec|
  spec.name          = "rchilli_cv_parser"
  spec.version       = RchilliCvParser::VERSION
  spec.authors       = ["Gerardo Ortega"]
  spec.email         = ["geraldavid7@gmail.com"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.summary       = %q{A simple gem to parse CVs.}
  spec.description   = %q{A simple gem to parse CVs.}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry'
  
  spec.add_dependency 'savon', '~> 2.10.0'
  spec.add_dependency 'activesupport', '~> 4.0.0'

end
