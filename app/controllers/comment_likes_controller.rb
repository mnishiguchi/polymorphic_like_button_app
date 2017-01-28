# Handles the liking and unliking for an individual comment in a post page.
class CommentLikesController < ApplicationController

  def create
    @comment = Comment.find(params[:comment_id])

    # We need to store this in case we need to re-render the page.
    @post = @comment.post

    if @comment.likes.create!(user: current_user)
      flash[:success] = "Liked the comment ##{@comment.id} of post ##{@post.id}"
      redirect_to @post
    else
      render 'post/show'
    end
  end

  def destroy
    comment = Comment.find(params[:comment_id])
    like = Like.find_by(likable: comment, user: current_user)
    like.destroy
    flash[:success] = "Uniked the comment ##{comment.id} of post ##{comment.post.id}"
    redirect_to comment.post
  end

  private

    def like_params
      params.require(:like).permit(:comment_id)
    end
end
