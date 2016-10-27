require 'active_record'
require 'sqlite3'

class CreateEmployeesAndDepartmentsMigration < ActiveRecord::Migration[5.0]

  def change
    create_table :departments do |t|
      t.string :name
    end

    create_table :employees do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.float :salary
      t.text :review
      t.boolean :satisfactory
      t.references :department
    end
  end

end
