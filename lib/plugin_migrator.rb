require "string-cases"
load "#{File.dirname(__FILE__)}/tasks/plugin_migrator_tasks.rake" if ::Kernel.const_defined?(:Rake)

module PluginMigrator
  def self.const_missing(name)
    require_relative "plugin_migrator/#{::StringCases.camel_to_snake(name)}"
    raise LoadError, "Still not loaded: '#{name}'." unless ::PluginMigrator.const_defined?(name)
    return ::PluginMigrator.const_get(name)
  end
end
