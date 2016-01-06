[![Code Climate](https://codeclimate.com/github/kaspernj/plugin_migrator/badges/gpa.svg)](https://codeclimate.com/github/kaspernj/plugin_migrator)
[![Test Coverage](https://codeclimate.com/github/kaspernj/plugin_migrator/badges/coverage.svg)](https://codeclimate.com/github/kaspernj/plugin_migrator)
[![Build Status](https://img.shields.io/shippable/540e7b9d3479c5ea8f9ec246.svg)](https://app.shippable.com/projects/540e7b9d3479c5ea8f9ec246/builds/latest)

# PluginMigrator

Run all plugin-migrations without installing them as real migrations in every app.

## Install

Add to your plugin's Gemfile and bundle:
```ruby
gem "plugin_migrator"
```

Rename the "db/migrate" to "db/plugin_migrate".

## Usage

Run the following rake-task to run all missing plugin-migrations:
```
bundle exec rake plugin_migrator:migrate
```

Do rollbacks like so:
```
bundle exec rake plugin_migrator:rollback
```


This project rocks and uses MIT-LICENSE.
