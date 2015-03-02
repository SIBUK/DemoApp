class Post < ActiveRecord::Base
  enum posttype: {text: 0, image: 1, video: 2, music: 3, quote: 4, dialogue: 5}

  belongs_to :category
  has_many :pics, :dependent => :destroy
  accepts_nested_attributes_for :pics, :reject_if => lambda { |attributes| attributes[:thumb].blank? }, :allow_destroy => true

  def get_formatted_post
    kfff = 0
  end
end
