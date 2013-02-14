# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Blog::Application.initialize!

#mail
ActionMailer::Base.smtp_settings = {
      :address        => 'smtp.gmail.com',
      :port           => 587,
      :domain		  => "gmail.com",
      :user_name      => 'projetrails2013@gmail.com',
      :password       => 'application',
      :authentification =>"plain",
      :enable_starttls_auto => true
}
