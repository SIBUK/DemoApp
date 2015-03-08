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
    @post_comment = PostComment.new(post_comment_params)
    if @post_comment.save
      flash[:notice] = 'Comment successfully created'
      redirect_to(@post_comment.post)
    else
      flash[:notice] = 'Error creating comment'
      redirect_to(@post_comment.post)
    end
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

