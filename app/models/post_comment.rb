class PostComment < ActiveRecord::Base
  belongs_to :post
  belongs_to :post_comment
  has_many :post_comments, dependent: :destroy
end
