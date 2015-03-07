class PostComment < ActiveRecord::Base
  belongs_to :post
  belongs_to :post_comment
  has_many :post_comments, dependent: :destroy

  validates_presence_of :name
  validates_length_of :name, within: 1..30
  validates_presence_of :body
end
