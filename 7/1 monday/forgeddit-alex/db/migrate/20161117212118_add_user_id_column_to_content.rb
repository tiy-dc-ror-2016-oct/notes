class AddUserIdColumnToContent < ActiveRecord::Migration[5.0]
  def change
    add_column :contents, :user_id, :integer
  end
end
