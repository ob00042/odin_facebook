class CommentsController < ApplicationController

  def create
  	@post = Post.find_by(id: params[:post_id])
  	@comment = @post.comments.build(comment_params)
  	@comment.user = current_user
  	if @comment.save
  		flash[:notice] = "Comment created"
  		redirect_to user_post_path(id: params[:post_id], user_id: @post.user.id)
  	else
  		flash[:notice] = "Unable to create comment"
  		redirect_to user_post_path(id: params[:post_id], user_id: @post.user.id)
  	end
  end

  def destroy
  	@comment = Comment.find(params[:id])
  	@comment.destroy
  	redirect_to user_post_path(id: params[:post_id], user_id: params[:user_id])
  end

  private

  	def comment_params
  		params.require(:comment).permit(:title, :text)
  	end
end
