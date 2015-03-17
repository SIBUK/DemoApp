class AddThumbToPosts < ActiveRecord::Migration
  def change
    add_attachment :posts, :thumbnail
  end
end
