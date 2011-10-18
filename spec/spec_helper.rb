require 'simplecov'
SimpleCov.start 'rails'

# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rspec'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  # == Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  config.mock_with :rspec

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  require 'database_cleaner'
  DatabaseCleaner.strategy = :truncation

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = false

  require 'fakeweb'
  FakeWeb.allow_net_connect = false
  definition = Person.attachment_definitions[:attachment]
  path = "https*://s3-eu-west-1.amazonaws.com/.*"
  path.gsub!(/:([^\/\.]+)/) do |match|
      "([^\/\.]+)"
    end  
  FakeWeb.register_uri(:put, Regexp.new(path), :body => "OK")
  
  require 'faker'
  Faker::Config.locale = :en
  
  config.include Devise::TestHelpers, :type => :controller
  
end
