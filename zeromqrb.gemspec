# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'zero_mq/version'

Gem::Specification.new do |spec|
  spec.name          = "zeromqrb"
  spec.version       = ZeroMQ::VERSION
  spec.authors       = ["Bulat Shakirzyanov"]
  spec.email         = ["bulat@twilio.com"]
  spec.description   = %q{High level wrapper for ffi-rzmq gem}
  spec.summary       = %q{High level wrapper for ffi-rzmq gem}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_runtime_dependency "ffi-rzmq", "~> 2.0"
end
