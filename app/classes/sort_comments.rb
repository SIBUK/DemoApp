# As replies are made to previously posted comments they get saved to the database in a way that means they are not
# ordered suitably for them to be easily displayed on the screen. They end up ad-hoc. This class re-arranges
# them in to a Binary Tree which can be recursed through easily when required.
# Comments that are made in reply to other comments are added to the tree as new nodes

# This class acts as a node on the tree
class CommentNode
  attr_accessor :comment, :nodes
  def initialize(comment)
    @nodes = []         # Holds an array of other nodes
    @comment = comment  # Stores this node's comment
  end
end

class SortComments
  private
  def initialize(comments)
    # Instance variables
    @comments = comments.order(created_at: :desc).to_a
    @root_node = []  # Stores the sorted comments
    @responses = 0   # keeps count of the number of comments that are just in response to the actual post and ignores ones that are in response to other comments
  end

# Add new nodes to the tree
  def add_nodes(node, id)
    comments, @comments = @comments.partition{|sub| sub[:post_comment_id] == id}
    if !id; @responses = comments.count end
    comments.each do |comment|
      new_node = CommentNode.new(comment)
      node.nodes.push(new_node)
      add_nodes(new_node, comment.id)
    end
  end

  public

  # Begin creating the Binary Tree of comments and return it once finished
  def sort_comments()
    # create the root node of the Binary Tree
    @root_node = CommentNode.new(nil)
    add_nodes(@root_node, nil)
    return @root_node
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

end