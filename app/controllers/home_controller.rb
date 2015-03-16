class HomeController < ApplicationController
  @@display_count = 10

  def index
    if params[:page]
      @page = params[:page].to_i
      offset = [0, @page * @@display_count].max
    else
      @page = 0
      offset = 0
    end

    @q = Post.search(params[:q])
    @posts = params[:sel] ? Post.find(params[:sel]) : @q.result(distinct: true).limit(@@display_count).offset(offset)
    @more = (offset + @@display_count) < @q.result(distinct: true).count
    @popular = Post.order('num_likes DESC').limit(3)
  end
end
