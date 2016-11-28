class RenameAuthorIdToUserIdForMicroPosts < ActiveRecord::Migration[5.0]
  def change
    rename_column :micro_posts, :author_id, :user_id
  end
end
