class UserMailer < ActionMailer::Base
	default from: 'odin@face.com'
  def welcome_email(user)
  	@user = user
  	mail(to: @user.email, subject: 'Welcome to Odin Facebook')
  end
end
