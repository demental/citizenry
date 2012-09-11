require 'capybara/json'
RSpec.configure do |config|
  Capybara.current_driver = :rack_test_json
  config.include Capybara::Json, type: :acceptance

end