# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sinatra/frank/version'

Gem::Specification.new do |spec|
  spec.name          = "sinatra-frank"
  spec.version       = Sinatra::Frank::VERSION
  spec.authors       = ["Sean Behan"]
  spec.email         = ["inbox@seanbehan.com"]
  spec.description   = %q{Frank: Helpers for Sinatra}
  spec.summary       = %q{Frank: Helpers for Sinatra Applications}
  spec.homepage      = "https://github.com/seanbehan/sinatra-frank"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
