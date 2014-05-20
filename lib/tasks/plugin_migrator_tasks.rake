namespace :plugin_migrator do
  task "migrate" => :environment do
    ActiveRecord::Migration.verbose = true
    
    PluginMigrator::MigrationsHelper.new.migrations do |migration|
      migration.migrate! if !migration.migrated?
    end
    
    Rake::Task["db:schema:dump"].invoke if ActiveRecord::Base.schema_format == :ruby
  end
  
  task "rollback" => :environment do
    ActiveRecord::Migration.verbose = true
    
    PluginMigrator::MigrationsHelper.new.migrations do |migration|
      migration.rollback! if migration.migrated?
    end
  end
end
