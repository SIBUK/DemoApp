class HomeController < ApplicationController
  def index
    @q = Post.search(params[:q])
    @posts = params[:sel] ? Post.find(params[:sel]) : @q.result(distinct: true)
    @popular = Post.order('num_likes DESC').limit(3)
  end
end
