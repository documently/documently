require_relative "lib/documently/version"

Gem::Specification.new do |spec|
  spec.name = "documently"
  spec.summary = "A comprehensive toolkit for building fast websites"
  spec.description = <<~TEXT
    A comprehensive toolkit for building fast websites. Documently transforms a
    directory of HTML templates, plaintext files, and assets into a parallel
    directory of HTML, CSS, and JavaScript files.
  TEXT

  spec.author = "Liam Egan"
  spec.email = "liam@liamegan.com"

  spec.version = Documently::VERSION
  spec.license = "MIT"

  spec.files = Dir["lib/**/*.rb", "LICENSE"]

  spec.required_ruby_version = ">= 2.5"

  spec.add_dependency "erubi", "~> 1.10"
  spec.add_dependency "kramdown", "~> 2.3"
  spec.add_dependency "kramdown-parser-gfm", "~> 1.1"
  spec.add_dependency "zeitwerk", "~> 2.4"

  spec.add_development_dependency "minitest", "~> 5.14"
  spec.add_development_dependency "purdytest", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "simplecov", "~> 0.21"
end
