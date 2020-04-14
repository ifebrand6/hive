# Load the Rails application.
require_relative 'application'
ADMIN_EMAIL = ENV["admin_email"]
GMAIL_USERNAME = ENV["gmail_username"]
GMAIL_PASSWORD = ENV["gmail_password"]
# Initialize the Rails application.
Rails.application.initialize!
