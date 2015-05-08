class PluginMigrator::MigrationsHelper
  def migrations
    version_helper = ::PluginMigrator::VersionHelper.new

    Gem.loaded_specs.values.each do |gem_i|
      gem_path = gem_i.gem_dir
      plugin_migrator_path = "#{gem_path}/db/plugin_migrate"
      next unless File.exists?(plugin_migrator_path)

      migrations_for_path(plugin_migrator_path).each do |file|
        match = file.match(/^(\d+)_(.+)\.rb$/)
        next unless match

        migration_path = "#{plugin_migrator_path}/#{file}"
        migration_class_name = StringCases.snake_to_camel(match[2])
        migration_version = match[1].to_i

        migration = ::PluginMigrator::Migration.new(
          :path => migration_path,
          :version => migration_version,
          :class_name => migration_class_name,
          :version_helper => version_helper
        )

        yield migration
      end
    end
  end

  def migrations_for_path(path)
    Dir.new(path).to_a.sort { |dir1, dir2| dir1 <=> dir2 }.select do |file|
      File.extname(file) == '.rb'
    end
  end
end
