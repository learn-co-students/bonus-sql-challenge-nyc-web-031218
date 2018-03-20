require 'bundler'
Bundler.require

# Setup a DB connection here


require_relative "sql_runner"

@db = SQLite3::Database.new('database.db')
DB = {:conn => @db}
@db.execute("DROP TABLE IF EXISTS daily_show_guests;")
@sql_runner = SQLRunner.new(@db)
@sql_runner.execute_schema_migration_sql
