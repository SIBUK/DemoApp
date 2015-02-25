class Image < ActiveRecord::Base
  belongs_to :post

  has_attached_file :image, :styles => { large: "1920x1080", medium: "1280x720", small: "640x360", thumb: "96x96#" }#, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
