class ChangeNameToTitleForContent < ActiveRecord::Migration[5.0]
  def change
    rename_column :contents, :name, :title
  end
end
