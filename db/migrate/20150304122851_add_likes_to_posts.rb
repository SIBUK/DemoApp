class AddLikesToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :num_likes, :integer, default: 0
  end
end
