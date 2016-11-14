require "pry"
require "active_record"

require_relative "db/connection"
require_relative "db/migrations/create_animals_table"
require_relative "animal"

Pry.start
