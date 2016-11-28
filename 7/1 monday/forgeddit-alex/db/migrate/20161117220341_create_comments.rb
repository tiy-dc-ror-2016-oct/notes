class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :content_id
      t.text :user_comment

      t.timestamps
    end
  end
end
