require 'active_record'
require 'sqlite3'
require 'pry'

ActiveRecord::Base.establish_connection({
  adapter: 'sqlite3',
  database: 'dev.sqlite3'
  })

class InitialMigration < ActiveRecord::Migration[5.0]

  def up

    create_table :developers do |t|
      t.string :name
      t.string :email
      t.date :start_on
      t.integer :dev_type_id
    end

    create_table :dev_type do |t|
      t.string :type
    end

    create_table :projects do |t|
      t.string :name
      t.datetime :start_at
      t.integer :client_id
    end

    create_join_table(:projects, :developers)

    create_table :clients do |t|
      t.string :name
      t.integer :industry_id
    end

    create_table :industries do |t|
      t.string :name
    end

    create_table :time_entry do |t|
      t.references :developer
      t.integer :project_id
      t.datetime :date_of_entry
      t.decimal :hours_worked, precision: 3, scale: 2
    end

    create_table :comments do |t|
      t.integer :developer_id
      t.integer :commentable_id
      t.string :commentable_type
      t.string :comment_input
      t.timestamps
    end

  end

  def down
    drop_table :developers
    drop_table :projects
    drop_table :clients
    drop_table :dev_type
    drop_table :industries
    drop_table :time_entry
    drop_table :comments
    drop_join_table(:projects, :developers)
  end

  begin
    InitialMigration.migrate(:down)
  rescue
  end

  InitialMigration.migrate(:up)

end
