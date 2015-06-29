# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lovely/version'

Gem::Specification.new do |spec|
  spec.name          = 'lovely'
  spec.version       = Lovely::VERSION
  spec.authors       = ['Abdelkader Boudih']
  spec.email         = ['terminale@gmail.com']

  spec.summary       = %q{Add Like capability to models}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/seuros/lovely"
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test)/}) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'activerecord', '>= 4.2'
  spec.add_development_dependency 'bundler', '~> 1.9'
  spec.add_development_dependency 'rake', '~> 10.0'
end
