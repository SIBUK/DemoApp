class HomeController < ApplicationController
  def index
    @posts = params[:sel] ? Post.find(params[:sel]) : Post.all
    @popular = Post.order('num_likes DESC').limit(3)
  end
end
