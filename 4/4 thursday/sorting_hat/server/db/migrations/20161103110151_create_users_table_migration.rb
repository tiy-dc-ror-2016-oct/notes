class CreateUsersTableMigration < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.timestamps null:true
    end
  end
end
