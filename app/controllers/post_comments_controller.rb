class PostCommentsController < ApplicationController

  private

  def post_comment_params
    params.require(:post_comment).permit(:name, :email, :body, :website, :post_id, :post_comment_id)
  end

  public

  def new
    @new_post_comment = PostComment.new
    @popular = Post.order('num_likes DESC').limit(3)
  end

  def create
    post_comment = PostComment.new(post_comment_params)
    if post_comment.save
      # We have to get a bit funky here now and create a node in a way that works correctly the the _comment views recursive functionality
      @post_node = CommentNode.new(nil)
      @post_node.nodes.push( CommentNode.new(post_comment) )
    else
      flash[:notice] = 'Error creating comment'
    end
    @new_id = post_comment.id
    @id = post_comment.post_comment_id
    return @post_node
  end

  def index
    @post_comment = PostComment.all
    @popular = Post.order('num_likes DESC').limit(3)
  end

  def show
    #Rails.logger.debug params.inspect
    @post_comment = PostComment.find(params[:id])
    new
  end


end

