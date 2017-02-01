# Handles the liking and unliking for an individual comment in a post page.
class Comments::LikesController < ApplicationController

  def create
    @comment = Comment.find(params[:comment_id])
    @comment.likes.create!(user: current_user)

    respond_to do |format|
      format.html { redirect_to @comment.post }
      format.js   {}
    end
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    @comment.likes.where(likable: @comment, user: current_user).destroy_all
    
    respond_to do |format|
      format.html { redirect_to @comment.post }
      format.js   {}
    end
  end

  private

    def like_params
      params.require(:like).permit(:comment_id)
    end
end
