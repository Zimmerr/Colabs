ENV['RAILS_ENV'] ||= 'test'
# require 'rails/test_helper'
require_relative '../config/environment'
require 'test/unit/rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixture :all

  # Add more helper methods to be used by all tests here...
end
