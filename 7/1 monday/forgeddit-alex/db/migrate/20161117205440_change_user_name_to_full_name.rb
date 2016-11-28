class ChangeUserNameToFullName < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :name, :full_name
  end
end
