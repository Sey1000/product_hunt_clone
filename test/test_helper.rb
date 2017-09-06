# environments test.rb
ENV['RAILS_ENV'] ||= 'test'

# load application
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

# configure reporter
require 'minitest/reporters'
Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new]

# populate database with fixture (seeding)
class ActiveSupport::TestCase
  fixtures :all
end

require 'capybara/rails'
class ActionDispatch::IntegrationTest
  include Capybara::DSL
  # after finishing test
  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver # = poltergeist
    Warden.test_reset! # used by poltergeist (ex. log out test user)
  end
end

require 'capybara/poltergeist'
Capybara.default_driver = :poltergeist

include Warden::Test::Helpers
Warden.test_mode! # no need to provide password to log in the user, etc.