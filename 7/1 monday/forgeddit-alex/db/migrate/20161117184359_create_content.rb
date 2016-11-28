class CreateContent < ActiveRecord::Migration[5.0]
  def change
    create_table :contents do |t|
      t.string :name
      t.string :type
      t.text :description

      t.timestamps
    end
  end
end
