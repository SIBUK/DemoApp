class PostCommentsController < InheritedResources::Base

  private

    def post_comment_params
      params.require(:post_comment).permit(:name, :email, :body, :website, :post_id, :post_comment_id)
    end

  public

  def new
    @post_comment = PostComment.new
    @popular = Post.order('num_likes DESC').limit(3)
  end

  def create
    ddd = 0
  end

  def index
    @post_comment = PostComment.all
    @popular = Post.order('num_likes DESC').limit(3)
  end

  def show
    @post_comment = PostComment.find(params[:id])
    @popular = Post.order('num_likes DESC').limit(3)
  end
end

