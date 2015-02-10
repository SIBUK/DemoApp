class Post < ActiveRecord::Base

  belongs_to :cagegory

  private

  def location_params
    params.require(:location).permit(:title, :body, :category_id, :author_id)
  end
end
