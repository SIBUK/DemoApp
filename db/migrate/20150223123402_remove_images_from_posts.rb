class RemoveImagesFromPosts < ActiveRecord::Migration
  def self.up
    remove_attachment :posts, :image
  end

  def self.down
    change_table :posts do |t|
      t.attachment :image
    end
  end
end
