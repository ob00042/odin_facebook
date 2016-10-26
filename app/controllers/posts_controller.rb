class PostsController < ApplicationController

	before_action :set_user, only: [:index, :show]
	before_action :set_post, only: [:edit, :destroy]

	def index
		@posts = @user.posts
	end

	def new
		@post = current_user.posts.build
	end

	def show
		@post = @user.posts.find(params[:id])
		@likes = @post.likes
		@comments = @post.comments
		@comment = @post.comments.build
	end

	def create
		@post = current_user.posts.build(post_params)
		if @post.save
			flash[:notice] = "Posted!"
			redirect_to user_post_path(user_id: current_user.id, id: @post.id)
		else
			flash[:notice] = "Unable to post"
			redirect_to current_user
		end
	end

	def edit

	end

	def update
		@post = current_user.posts.find(params[:id])
		if @post.update_attributes(post_params)
			flash[:notice] = "Post updated"
			redirect_to user_post_path(user_id: current_user.id, id: @post.id)
		else
			flash[:notice] = "Post not updated"
			redirect_to current_user
		end
	end

	def destroy
		@post.destroy
		flash[:notice] = "Post destroyed"
		redirect_to user_posts_path(user_id: current_user.id)	
	end

	private

		def set_user
			@user = User.find(params[:user_id])
		end

		def set_post
			@post = current_user.posts.find(params[:id])
		end

		def post_params
			params.require(:post).permit(:title, :text)
		end
end
