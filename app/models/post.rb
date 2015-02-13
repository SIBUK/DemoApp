class Post < ActiveRecord::Base
  enum posttype: {text: 0, image: 1, video: 2, music: 3, quote: 4}

  belongs_to :category

  has_attached_file :image, :styles => { large: "1010x500", medium: "630x250>", small: "490x242", thumb: "67x67>" }#, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  #validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }
  #do_not_validate_attachment_file_type :image
end
