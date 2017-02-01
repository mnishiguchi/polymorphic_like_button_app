class PostsController < ApplicationController
  def index
    if params[:user_id]
      @user  = User.find(params[:user_id])
      @posts = @user.posts
    else
      @posts = Post.all
    end
  end

  def show
    @post = Post.find(params[:id])
  end
end
