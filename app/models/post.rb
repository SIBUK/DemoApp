class Post < ActiveRecord::Base
  enum posttype: {text: 0, image: 1, video: 2, music: 3, quote: 4, dialogue: 5}

  belongs_to :category
  has_many :images, :dependent => :destroy
  accepts_nested_attributes_for :images, :reject_if => lambda { |attributes| attributes[:picture].blank? }, :allow_destroy => true

  has_attached_file :image, :styles => { large: "1920x1080", medium: "1280x720", small: "640x360", thumb: "96x96#" }#, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/



  def image_content_type
    aaa = 0
  end
end
