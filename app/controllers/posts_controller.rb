class PostsController < ApplicationController
  private
  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end

  public

  def index
    @q = Post.search(params[:q])
    @posts = @q.result(distinct: true)
    @popular = Post.order('num_likes DESC').limit(3)
  end

  def show
    @post = Post.find(params[:id])
    @popular = Post.order('num_likes DESC').limit(3)
    sorted_comments = SortComments.new(PostComment.where(post_id: params[:id]))
    @comments = sorted_comments.sort_comments
    @response = sorted_comments.get_response
    @post_comment = PostComment.new(post: @post)
  end

  def new
    @post = Post.new
    #@catergory = Catergory.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, :notice => "Your post has been saved"
    else
      render "new"
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to posts_path, :notice => "Your post has been updated"
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.delete
    redirect_to posts_path, :notice => "Your post was deleted"
  end

  def like
    @post = Post.find(params[:id])
    @post.like
  end

  def reply
    @post = Post.find(params[:id])
    @comment_id = params[:comment_id]
    @post_comment = PostComment.new(post: @post)
  end

end
