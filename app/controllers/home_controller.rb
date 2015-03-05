class HomeController < ApplicationController
  def index
    @posts = Post.all
    @popular = Post.order('num_likes DESC').limit(3)
  end
end
