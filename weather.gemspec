# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'weather'
  spec.version       = '1.0.0'
  spec.authors       = ['kevstessens']
  spec.email         = ['kevstessens@gmail.com']
  spec.description   = 'Altoros test'
  spec.summary       = 'summary'
  spec.homepage      = 'http://www.linkedin.com/ar/kevstessens'
  spec.license       = 'MIT'

  spec.files         = %w(lib/weather.rb lib/weather/weather_info.rb lib/weather/weather_request_error.rb)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake', '~> 0'
end
