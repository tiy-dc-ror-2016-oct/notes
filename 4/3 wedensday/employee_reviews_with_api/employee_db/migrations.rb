require 'active_record'

class CompanyDataMigration < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.timestamps null: false
    end

    create_table :departments do |t|
      t.references :company
      t.string :name
      t.timestamps null: false
    end

    create_table :employees do |t|
      t.references :department
      t.string :name
      t.string :email
      t.string :phone
      t.decimal :salary, precision: 8, scale: 2
      t.text :review
      t.boolean :satisfactory
      t.timestamps null: false
    end
  end
end
