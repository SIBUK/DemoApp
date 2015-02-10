class Category < ActiveRecord::Base

  has_many :posts

  private

  def location_params
    params.require(:location).permit(:name)
  end
end
