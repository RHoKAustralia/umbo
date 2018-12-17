ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def log_in(email)
    post "/login",
      params: { user: { email: email, password: 'testing123' } }
  end

  def log_in_and_follow(email)
    log_in email
    follow_redirect!
  end

end
