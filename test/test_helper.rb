ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Returns true if a test member is logged in.
  def is_logged_in?
    !session[:member_id].nil?
  end

  # Logs in as a particular member
  def log_in_as(member)
  	session[:member_id] = member.id
  end
end

class ActionDispatch::IntegrationTest

	# Logs in as a particular user
	def log_in_as(member, password: 'password', remember_me: '1')
		post login_path, params: { session: { email: member.email, 
												password: password,
												remember_me: remember_me } }
	end	
end										
