require "pry"
require "active_record"
require_relative "../animal"
require_relative "../drug"

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "db/dev.sqlite3"
)
