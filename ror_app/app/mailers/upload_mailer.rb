class UploadMailer < ActionMailer::Base
  default :from => "no-reply@gmail.com"

  def notification_email(users, upload)
    @upload = upload
    @users = User.findByGroup(@upload.uploadGroup)
    @url  = "http://0.0.0.0:3000/new"
    recipients = @users.collect(&:email).join(",")
    mail(:to => recipients, :subject => "A new Upload has been added !")
   end
 end

