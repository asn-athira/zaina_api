# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
ActionMailer::Base.smtp_settings = {
  :user_name => 'apikey',
  :password => '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',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true,
}