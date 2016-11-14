require "minitest/autorun"
require "minitest/pride"
require "active_record"
require "pry"

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "db/test.sqlite3"
)

require_relative "../animal"
require_relative "../db/migrations/create_animals_table"

begin
  CreateAnimalsTableMigration.migrate(:down)
rescue ActiveRecord::StatementInvalid
end

CreateAnimalsTableMigration.migrate(:up)
