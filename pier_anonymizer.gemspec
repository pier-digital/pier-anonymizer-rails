require_relative 'lib/pier_anonymizer/version'

Gem::Specification.new do |spec|
  spec.name          = "pier_anonymizer"
  spec.version       = PierAnonymizer::VERSION
  spec.authors       = ["João Holanda"]
  spec.email         = ["joaoholandajr@gmail.com"]

  spec.summary       = %q{Utils for data anonymization}
  spec.description   = %q{In order to be LGPD compliant, this gem offers utils to anonymize data}
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
