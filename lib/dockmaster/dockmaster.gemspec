# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dockmaster/version'

Gem::Specification.new do |spec|
  spec.name          = "dockmaster"
  spec.version       = Dockmaster::VERSION
  spec.authors       = ["C. Jason Harrelson"]
  spec.email         = ["jason@lookforwardenterprises.com"]
  spec.summary       = %q{A set of tools for setting up and using a Docker ruby development environemnt.}
  spec.description   = %q{A set of tools for setting up and using a Docker ruby development environemnt.  See README for more details.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = %w(dockmaster)
  #spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "acclimate"
  spec.add_dependency "autoloaded"
end
