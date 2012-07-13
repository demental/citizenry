# Load the rails application
require File.expand_path('../application', __FILE__)

require 'aws/s3'
AWS::S3::DEFAULT_HOST = "s3-eu-west-1.amazonaws.com"

# Initialize the rails application
Citizenry::Application.initialize!
