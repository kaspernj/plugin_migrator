require "string-cases"
load "#{File.dirname(__FILE__)}/tasks/plugin_migrator_tasks.rake" if ::Kernel.const_defined?(:Rake)

module PluginMigrator
  path = "#{File.dirname(__FILE__)}/plugin_migrator"

  autoload :Migration, "#{path}/migration"
  autoload :MigrationsHelper, "#{path}/migrations_helper"
  autoload :VersionHelper, "#{path}/version_helper"
end
