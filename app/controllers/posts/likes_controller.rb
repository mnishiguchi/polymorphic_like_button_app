# Handles the liking and unliking for an individual post in a post page.
class Posts::LikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @post.likes.create!(user: current_user)

    respond_to do |format|
      format.html { redirect_to @post }
      format.js   {}
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post.likes.where(likable: @post, user: current_user).destroy_all

    respond_to do |format|
      format.html { redirect_to @post }
      format.js   {}
    end
  end

  private

    def like_params
      params.require(:like).permit(:post_id)
    end
end
