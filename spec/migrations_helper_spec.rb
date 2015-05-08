require 'spec_helper'

describe PluginMigrator::MigrationsHelper do
  it '#migrations_for_path' do
    helper = PluginMigrator::MigrationsHelper.new
    migrations = helper.migrations_for_path(Rails.root.join('db', 'plugin_migrate'))
    expect(migrations).to eq ["20150508091108_create_users.rb", "20150508091203_add_email_to_users.rb"]
  end
end
