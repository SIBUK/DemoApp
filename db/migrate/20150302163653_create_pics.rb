class CreatePics < ActiveRecord::Migration
  def change
    create_table :pics do |t|
      t.belongs_to :post, index:true
      t.string :name
      t.attachment :image

      t.timestamps
    end
  end
end
