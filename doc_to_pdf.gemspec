# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'doc_to_pdf/version'

Gem::Specification.new do |spec|
  spec.name          = "doc_to_pdf"
  spec.version       = DocToPdf::VERSION
  spec.authors       = ["Ruben Espinosa"]
  spec.email         = ["rderoldan1@gmail.com"]
  spec.description   = %q{Turn documentation stored in doc folder in your rails app in a pdf file using wkhtmltopdf}
  spec.summary       = %q{Turn documentation in pdf file}
  spec.homepage      = "http://rderoldan1.github.io/doc_to_pdf/"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.requirements << 'wkhtmltopdf'
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_runtime_dependency "colorize"
  spec.add_runtime_dependency "nokogiri"
end
