class LikesController < ApplicationController
  def create
  	@like = current_user.likes.build(post_id: params[:id])
  	@like.save
  	redirect_to user_post_path(id: params[:id], user_id: params[:user_id])
  end

  def destroy
  	@like = current_user.likes.find_by(post_id: params[:id])
  	@like.destroy
  	redirect_to user_post_path(id: params[:id], user_id: params[:user_id])
  end
end
