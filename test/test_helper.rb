ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical
  # order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def is_logged_in?
    !session[:user_id].nil?
  end

  def log_in_as(user, options = {})
    session = {}
    session[:user_id] = nil

    password    = options[:password]    || 'password'
    remember_me = options[:remember_me] || '1'
    
    session_params = {
      session: { 
        email: user.email,
        password: password,
        remember_me: remember_me 
      }
    }

    post login_path(session_params)
  end   
end 