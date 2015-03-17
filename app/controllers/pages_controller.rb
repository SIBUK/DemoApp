class PagesController < ApplicationController
  def about
  end

  def contact
    @popular = Post.order('num_likes DESC').limit(3)
  end

  def resources
  end
end
