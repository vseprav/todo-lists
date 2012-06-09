require 'rubygems'
require 'active_support/all'
require 'database_cleaner'
require 'factory_girl'
require 'simplecov'
SimpleCov.start do
  add_filter "/plugins/"
  add_filter "spec/controllers/"
  add_filter "spec/models/"
  add_filter "spec/helpers/"
  add_filter "spec/factories/"
  add_filter "spec/*.*"
  add_filter "lib/*.*"
  add_filter "config/*.*"
end
SimpleCov.start 'rails'

ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
RSpec.configure do |config|

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true


end
