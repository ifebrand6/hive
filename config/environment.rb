# Load the Rails application.
require_relative 'application'
require "paystack"
ADMIN_EMAIL = 'ifebrand6@gmail.com'
GMAIL_USERNAME = 'ifebrand6@gmail.com'
GMAIL_PASSWORD = '1997date'
PAYSTACK_PUBLIC_KEY = Paystack.new
PAYSTACK_PRIVATE_KEY = Paystack.new

# Initialize the Rails application.
Rails.application.initialize!
