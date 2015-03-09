class CommentNode
  attr_accessor :comment, :parent, :children, :indent
  def initialize(comment)
    @comment = comment
    @children = []
    @indent = -1
    @parent = nil
  end
end

class SortComments
  def initialize(comments)
    # Instance variables
    @comments = comments.order(created_at: :asc)
    @sorted = []
    @indent = 0
  end

public
  def recurse(post_comment_id = nil)


    com = @comments#.where(post_comment_id: post_comment_id)
    @comments = @comments.where.not(post_comment_id: post_comment_id)

    com.each do |comment|

      if comment.post_comment_id == post_comment_id
        node = CommentNode.new(comment)
        node.indent = @indent
        @sorted.push(node)
      end

      @indent += 1

      sub_comments = if comment.post_comment_id != post_comment_id
                       @comments.where(post_comment_id: comment.post_comment_id)
                     end

      if sub_comments
        sub_comments.each do |sub_comment|
          recurse(sub_comment.post_comment_id)
        end
      end

      @indent -= 1


    end

    aaaa = 0
  end

  def get_comments
    return @sorted
  end

end