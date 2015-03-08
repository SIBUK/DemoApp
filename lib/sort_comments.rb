class SortComments
  def initialize(comments)
    # Instance variables
    @comments = comments#.order(created_at: :asc)
  end

public
  def recurse
    @comments.each_with_index do |comment, count|
      aaa = comment.post_id
      bbb = comment.post_comment_id
      ccc = count
      fff = 0
    end
  end

end