require "string-cases"

class PluginMigrator::Migration
  def initialize(args)
    @args = args
    @version = args[:version]
    @version_helper = args[:version_helper]
  end
  
  def instance
    require @args[:path]
    @instance ||= @args[:class_name].constantize.new
  end
  
  def migrated?
    @version_helper.version_exists?(@version)
  end
  
  def migrate!
    instance.migrate(:up)
    @version_helper.add_version(@version)
  end
  
  def rollback!
    instance.migrate(:down)
    @version_helper.remove_version(@version)
  end
end
