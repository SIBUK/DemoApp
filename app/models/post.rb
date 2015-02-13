class Post < ActiveRecord::Base
  #PostType = [:text, :image, :video, :music, :quote]

  enum posttype: {text: 0, image: 1, video: 2, music: 3, quote: 4}

  belongs_to :category
end
