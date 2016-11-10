class CreateAnimalsTableMigration < ActiveRecord::Migration[5.0]
  def change
    create_table :animals do |t|
      t.string :name
      t.date :born_on
      t.string :species
    end
  end

end
