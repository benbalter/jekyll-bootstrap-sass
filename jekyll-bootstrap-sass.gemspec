# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll-bootstrap-sass/version'

Gem::Specification.new do |spec|
  spec.name          = 'jekyll-bootstrap-sass'
  spec.version       = Jekyll::BootstrapSass::VERSION
  spec.authors       = ['Ben Balter']
  spec.email         = ['ben.balter@github.com']

  spec.summary       = 'A plugin to add Twitter Bootstrap to your Jekyll site'
  spec.homepage      = 'https://github.com/benbalter/jekyll-bootstrap-sass'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |file|
    file.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ['lib']

  spec.add_dependency 'jekyll', '>= 2.5'
  spec.add_dependency 'bootstrap', '~> 4.0.0.alpha6'

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
end
