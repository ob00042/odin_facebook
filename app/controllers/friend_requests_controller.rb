class FriendRequestsController < ApplicationController
	before_action :set_friend_request, except: [:index, :create]

	def index
		@incoming = FriendRequest.where(friend: current_user)
		@outgoing = current_user.friend_requests
	end

	def create
		friend = User.find(params[:friend_id])
		@friend_request = current_user.friend_requests.build(friend: friend)
		if @friend_request.save
			flash[:notice] = "Friend request sent"
			redirect_to users_url
		else
			render json: @friend_request.errors, status: :unprocessable_entity
		end
	end

	def update
		@friend_request.accept
		flash[:notice] = "You are now friends with #{@friend.name}"
		redirect_to @friend
	end

	def destroy
		@friend_request.destroy
		head :no_content
	end

	private

		def set_friend_request
			@friend_request = FriendRequest.find(params[:id])
		end
end
