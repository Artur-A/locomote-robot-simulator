# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "robot_simulator/version"

Gem::Specification.new do |spec|
  spec.name          = "robot_simulator"
  spec.version       = RobotSimulator::VERSION
  spec.authors       = ["Artur-A"]

  spec.summary       = %q{A robot simulator.}
  spec.description   = %q{A small play game.}
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'bin' #"exe"
  spec.executables   = 'console'#spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # dependency
  spec.add_dependency 'colorize', '~> 0.8.1'
  spec.add_dependency 'ruby-enum', '~> 0.7.1'

  # dev_dependency
  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.6'
  spec.add_development_dependency 'rubysl-pty', '~> 2.0'

end
