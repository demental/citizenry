require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "active_resource/railtie"
require "sprockets/railtie"

require 'rack/jsonp'

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  # Bundler.require(*Rails.groups(:assets => %w(development test)))
  # If you want your assets lazily compiled in production, use this line
  Bundler.require(:default, :assets, Rails.env)
end


module Citizenry
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Custom directories with classes and modules you want to be autoloadable.
    # config.autoload_paths += %W(#{config.root}/extras)

    config.eager_load_paths = %w[mailers mixins models controllers helpers].map do |name|
      "#{config.root}/app/#{name}"
    end

    $LOAD_PATH << "#{config.root}/lib"
    config.autoload_paths << "#{config.root}/lib"
    config.autoload_paths += Dir["#{config.root}/lib/**/"]

    # Only load the plugins named here, in the order given (default is alphabetical).
    # :all can be used as a placeholder for all plugins not explicitly named.
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

    # Activate observers that should always be running.
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]

    # Enable the asset pipeline
    config.assets.enabled = true

    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'

    # get precompilation working on heroku:
    config.assets.initialize_on_precompile = false

    # Middleware!
    config.middleware.use Rack::JSONP
    # Raise exception on mass assignment protection for Active Record models
    config.active_record.mass_assignment_sanitizer = :strict

  end
end
