# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
 :user_name => 'app53572504@heroku.com',
 :password => 'SendGridCreds12345',
 :domain => 'https://intense-eyrie-92860.herokuapp.com',
 :address => 'smtp.sendgrid.net',
 :port => 587,
 :authentication => :plain,
 :enable_starttls_auto => true
}
