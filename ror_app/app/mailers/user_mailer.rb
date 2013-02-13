class UserMailer < ActionMailer::Base
  default :from => "radia.azrhar@live.fr"
 
  def welcome_email(user)
    @user = user
    @url  = "http://0.0.0.0:3000/"
    #@url  = "http://example.com/login"
    mail(:to => user.email, :subject => "Welcome to My Site")
  end
end
