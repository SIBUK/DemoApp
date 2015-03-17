class Post < ActiveRecord::Base
  enum posttype: {text: 0, image: 1, video: 2, music: 3, quote: 4, dialogue: 5}

  belongs_to :category
  has_many :pics, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  accepts_nested_attributes_for :pics, :reject_if => lambda { |attributes| attributes[:thumb].blank? }, :allow_destroy => true

  has_attached_file :thumbnail, styles: { thumb: "128x128#" }, default_url: "quote.png"
  validates_attachment_content_type :thumbnail, content_type: /\Aimage\/.*\Z/

  def like
    self.increment!(:num_likes)
  end
end
