ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'capybara/rails'
require 'capybara/minitest'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL
  # Make `assert_*` methods behave like Minitest assertions
  include Capybara::Minitest::Assertions
  
  Capybara.default_max_wait_time = 5
  # Reset sessions and driver between tests
  # Use super wherever this method is redefined in your individual test classes
  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end

  def attach_pic(user)
    user.avatar.attach(io: File.open(Rails.root.join("app", "assets", "images", "default.jpg")), 
    filename: 'default.jpg',
    content_type: "image/jpg")
  end

  def sign_in_as(user)
    visit new_user_session_path
    fill_in('Email', with: user.email)
    fill_in('Password', with: '123456')
    click_button "login-button"
  end
end