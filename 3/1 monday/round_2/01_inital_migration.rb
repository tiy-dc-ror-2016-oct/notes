require 'active_record'
require 'sqlite3'
require 'pry'

ActiveRecord::Base.establish_connection({
  adapter: 'sqlite3',
  database: 'dev.sqlite3'
})

class InitialMigration < ActiveRecord::Migration[5.0]

  def up
    create_table :cohorts do |t|
      t.string :name
    end

    create_table :students do |t|
      t.string :name
    end

    create_join_table :cohorts, :students

    create_table :picks do |t|
      t.integer :student_id
      t.datetime :picked_at
    end
  end

  def down
    drop_join_table :cohorts, :students
    drop_table :students
    drop_table :picks
    drop_table :cohorts
  end

end

begin
  InitialMigration.migrate(:down)
rescue
end

InitialMigration.migrate(:up)
