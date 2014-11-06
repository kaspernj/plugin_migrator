$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "plugin_migrator/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "plugin_migrator"
  s.version     = PluginMigrator::VERSION
  s.authors     = ["Kasper Johansen"]
  s.email       = ["k@spernj.org"]
  s.homepage    = "https://www.github.com/kaspernj/plugin_migrator"
  s.summary     = "Migrate plugin DB easily."
  s.description = "Migration of plugins DB migrations easily."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", ">= 4.0.0"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
end
