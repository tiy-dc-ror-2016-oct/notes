class ChangeTypeToContentlabel < ActiveRecord::Migration[5.0]
  def change
    rename_column :contents, :type, :content_label
  end
end
