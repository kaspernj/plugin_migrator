class PluginMigrator::VersionHelper
  def version_exists?(version_number)
    ActiveRecord::Base.connection.execute("SELECT * FROM schema_migrations WHERE version = '#{version_number}' LIMIT 1").any?
  end
  
  def add_version(version_number)
    ActiveRecord::Base.connection.execute("INSERT INTO schema_migrations (version) VALUES ('#{version_number}')")
  end
  
  def remove_version(version_number)
    ActiveRecord::Base.connection.execute("DELETE FROM schema_migrations WHERE version = '#{version_number}'")
  end
end
