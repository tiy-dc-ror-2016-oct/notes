class CreateFriendsMigration < ActiveRecord::Migration[5.0]
  def change
    create_table :friends do |t|
      t.integer :outgoing_animal_id
      t.integer :shy_animal_id
      t.timestamps
    end
  end
end
