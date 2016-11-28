class ChangeContentlabeltoLableltype < ActiveRecord::Migration[5.0]
  def change
    rename_column :contents, :content_label, :label_type
  end
end
