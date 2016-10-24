class Friendship < ApplicationRecord
	after_destroy :destroy_inverse_relationship

  belongs_to :user
  belongs_to :friend, class_name: "User"

  validate :not_self

  private

  	def destroy_inverse_relationship
  		friendship = friend.friendships.find_by(friend: user)
  		friendship.destroy if friendship
  	end

  	def not_self
  		errors.add(:friend, "can't be equal to user") if user == friend
  	end
end
