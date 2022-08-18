class RanemeUserId < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :users_id, :authorId
    rename_column :likes, :users_id, :authorId
    rename_column :posts, :users_id, :authorId
  end
end
