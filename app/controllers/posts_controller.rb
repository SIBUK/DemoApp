class PostsController < ApplicationController
  private
  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end

  public

  def index
    @posts = Post.all
    @popular = Post.order('num_likes DESC').limit(3)
  end

  def show
    @post = Post.find(params[:id])
    @popular = Post.order('num_likes DESC').limit(3)
    @comments = PostComment.where(post_id: params[:id])
    @post_comment = PostComment.new
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

end
