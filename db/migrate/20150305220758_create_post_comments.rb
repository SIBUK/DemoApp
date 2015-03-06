class CreatePostComments < ActiveRecord::Migration
  def change
    create_table :post_comments do |t|
      t.string :name
      t.string :email
      t.string :website
      t.text :body
      t.references :post, index: true
      t.references :post_comment, index: true

      t.timestamps
    end
  end
end
