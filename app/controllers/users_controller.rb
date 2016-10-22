class UsersController < ApplicationController
	before_action :authenticate_user!

	def show
		@user = User.find(params[:id])
	end

	def index
		@users = User.all
	end

	def destroy
		@user = current_user
		@user.destroy
		flash[:notice] = "User destroyed"
		redirect_to root_url
	end
end
