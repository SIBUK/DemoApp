# As replies are made to previously posted comments they get saved to the database in a way that means they are not
# ordered suitably for them to be easily displayed on the screen. They end up ad-hoc. This class re-arranges
# them and stores them in an array in the order that they should be displayed. It does this by checking if a comment is
# in reply to another comment and if so then it will recurse and deal with all the comments that are in reply to that
# comment before continuing. After recursing it will then deal with all comments that are in response to the same comment
# before returning and continuing where it left off. If there is a 'reply to a reply' then it will recurse again until
# all the comments are sorted.
# It will also set an 'indent' value which is used by the view to suitably position the comment indented from the left.
# Setting '@max_indent' will limit how many times a comment can be indented (to prevent them all getting squashed up
# on the right hand side of the screen after several 'replies to replies')

class SortComments
private
  # Small data structure for use by the SortComments class
  class CommentNode
    attr_accessor :comment, :indent
    def initialize(comment)
      @comment = comment
      @indent = 0
    end
  end

  def initialize(comments)
    # Instance variables
    @comments = comments.order(created_at: :desc).to_a
    @sorted = []     # Stores the sorted comments
    @depth = 0       # recursion depth
    @max_indent = 10 # The max number of levels to indent comments within the view (for aesthetic purposes)
    @responses = 0   # tracks the number of comments that are just in response to the actual post and ignores ones that are in response to other comments
  end

public
  # The main recursive function that sorts the comments
  def sort_comments(post_comment_id = nil)
    com = @comments.dup
    @comments.delete_if{ |post| post.post_comment_id == post_comment_id } # where.not(post_comment_id: post_comment_id) # make a copy of all remaining comments then remove all the ones that are not in response to the comment that has been replied to (or nil if this is the root)

    com.each do |comment|
      if comment.post_comment_id == post_comment_id   # if this comment is in reply to the previous comment then add it to the array
        node = CommentNode.new(comment)
        node.indent = @depth > @max_indent ? @max_indent : @depth
        @sorted.push(node)
        @responses += 1 unless @depth > 0
      end
      @depth += 1

      #sub_comments = if comment.post_comment_id != post_comment_id    # Get all replies to this comment (if any)
      #                 @comments.where(post_comment_id: comment.id)
      #               end

      #sub_comments = @comments.where(post_comment_id: comment.id)
      sub_comments = @comments.select {
        |v| v[:post_comment_id] == comment.id
      }

      if sub_comments
        sub_comments.each do |sub_comment|
          sort_comments(sub_comment.post_comment_id)                  # and if there are replies to this comment, then recurse
        end
      end

      @depth -= 1
    end
    return @sorted
  end

  # Get the sorted comments
  def get_comments
    return @sorted
  end

  # Set the level on indentation
  def set_maximum_indent(number_of_indents)
    @max_indent = number_of_indents
  end

  # A helper for the view to get the text with number of comments properly pluralised
  def get_response
    if @responses == 0
      return 'No Responses to '
    elsif @responses == 1
      return '1 Response to '
    else
      return @responses.to_s + ' Responses to '
    end
  end

  # Get the total number of comments left
  def get_total_num_comments
    return @sorted.count
  end
end