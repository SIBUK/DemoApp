class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.belongs_to :post, index:true
      t.string :name
      t.attachment :image

      t.timestamps
    end
  end
end
