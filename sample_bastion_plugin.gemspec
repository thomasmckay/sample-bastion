$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "sample_bastion_plugin/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "sample_bastion_plugin"
  s.version     = SampleBastionPlugin::VERSION
  s.authors     = ["thomasfmckay@gmail.com"]
  s.email       = ["foreman-dev@googlegroups.com"]
  s.homepage    = "http://theforeman.org"
  s.summary     = "Sample Bastion Plugin"
  s.description = "Sample Bastion Plugin"

  s.files = Dir["{app,config,lib}/**/*", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "bastion"
end
