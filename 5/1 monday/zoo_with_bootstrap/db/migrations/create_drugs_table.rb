class CreateDrugsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :drugs do |t|
      t.string :name
      t.integer :animal_id
      t.datetime :administered_at
      t.timestamps
    end
  end
end
