# Handles the liking and unliking for a post.
class PostLikesController < ApplicationController

  def create
    # We need to store this post instance in case we need to re-render the page.
    @post = Post.find(params[:post_id])

    if @post.likes.create!(user: current_user)
      flash[:success] = "Liked the post ##{@post.id}"
      redirect_to @post
    else
      render 'post/show'
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    like = Like.find_by(likable: post, user: current_user)
    like.destroy
    flash[:success] = "Unliked the post ##{post.id}"
    redirect_to post_path(params[:post_id])
  end

  private

    def like_params
      params.require(:like).permit(:post_id)
    end
end
