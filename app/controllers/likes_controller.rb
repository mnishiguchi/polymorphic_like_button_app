# class LikesController < ApplicationController
#
#   def create
#     @post = Post.find(params[:post_id])
#
#     @like = @post.likes.create!(user: current_user)
#
#     if @like
#       redirect_to @post
#     else
#       render 'post/show'
#     end
#   end
#
#   def destroy
#     @like = Like.find_by(post_id: params[:post_id], user: current_user)
#     @like.destroy
#     redirect_to post_path(params[:post_id])
#   end
#
#   private
#
#     def like_params
#       params.require(:like).permit(:post_id)
#     end
# end
