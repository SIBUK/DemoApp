class PostCommentsController < InheritedResources::Base

  private

    def post_comment_params
      params.require(:post_comment).permit(:name, :email, :body, :website, :post_id, :post_comment_id)
    end

  public

  def new
    @comment = Post_comment.new
  end
end

