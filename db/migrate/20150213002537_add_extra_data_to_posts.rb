class AddExtraDataToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :posttype, :integer, default: 0
    add_column :posts, :url, :string
    add_column :posts, :quoteauthor, :string
    add_column :posts, :song, :string
    add_column :posts, :artist, :string
    add_column :posts, :album, :string
  end
end
