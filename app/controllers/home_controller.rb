class HomeController < ApplicationController
  def index
    para = params[:key]

    if para != nil
      @allPosts = Post.where("title LIKE ?","%"+para+"%").order(created_at: :desc)
    else
      @allPosts = Post.all.order(created_at: :desc)
    end
  end  
end
