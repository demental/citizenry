source 'http://rubygems.org'

gem 'rails', '3.2.11'
gem 'rake'
gem 'rails-i18n'

group :production do
  gem 'pg'
end
# You may need to add the following to your .bash_profile (or
# similar):
#
#     export DYLD_LIBRARY_PATH="/usr/local/mysql/lib:$DYLD_LIBRARY_PATH"
#
# Note: the exact path to your MySQL lib/ directory may vary.
gem 'mysql2', '~> 0.3.2'
# Uncomment if you're using sqlite
# gem 'sqlite3-ruby', :require => 'sqlite3'


gem 'hoptoad_notifier'

#--[ Utility ]------------------------------------------------------------------
gem 'httparty', '~> 0.8.0'
gem "json", "~> 1.6.1"
gem 'addressable', '~> 2.2.4'

#--[ Authentication ]-----------------------------------------------------------
gem 'devise', "~> 1.4.5"

gem 'omniauth', "~> 1.0.3"
gem 'omniauth-twitter'
gem 'omniauth-linkedin'
gem 'omniauth-foursquare'
gem 'omniauth-twitter'
gem 'omniauth-facebook'
gem 'omniauth-yahoo'
gem 'omniauth-viadeo'
gem 'omniauth-github'
gem 'omniauth-openid'
gem 'omniauth-google-apps'

#-- [ APIClient ]---------------------------------------------------------------

# Client libraries for authenticated services
# TODO: Upgrade these to newer versions after omniauth 0.3 upgrade
gem 'twitter', git: 'git://github.com/sferik/twitter.git', tag: 'v2.1.1'
gem 'linkedin', '~> 0.3.7', :git => "git://github.com/pengwynn/linkedin.git", :tag => 'v0.3.7'
gem 'mogli', :git => "git://github.com/reidab/mogli.git" # facebook
gem 'foursquare2'    # https://gist.github.com/419219 <- github oauth docs!

# Automatic login provider selection
gem 'redfinger', '~> 0.1.0', :git => "https://github.com/reidab/redfinger.git"

gem 'ruby-openid', '~> 2.1.8'
gem 'net-dns', '~> 0.6.1', :require => 'net/dns/resolver'


#--[ Search ]-------------------------------------------------------------------
# If you're using the default sql-based search, you can comment this out.
#gem 'thinking-sphinx', '~> 2.0.1', :require => 'thinking_sphinx'

#--[ Model ]--------------------------------------------------------------------
gem "paperclip", "~> 2.3"
gem "inherited_resources", git: 'git://github.com/josevalim/inherited_resources.git'
gem "responders"

gem 'acts-as-taggable-on', "~> 2.3.1"

gem 'friendly_id', "~> 4.0.9"

gem 'paper_trail', '~> 2'
gem 'paper_trail_manager'
# gem 'paper_trail_manager', :git => 'git://github.com/igal/paper_trail_manager.git'
# gem 'paper_trail_manager', :path => '../paper_trail_manager'

#--[ View ]---------------------------------------------------------------------
gem "haml", "~> 3.1.2"
gem 'sass-rails'
gem 'formtastic', '~>1.2.4'
gem 'rdiscount'

group :assets do
  gem 'coffee-rails'
  gem 'uglifier'
  gem 'jquery-rails'
  gem 'bourbon'
  gem 'compass-rails', '~> 1.0.3'
  gem 'zurb-foundation', '~> 3.0.1'
end

#--[ Controller ]---------------------------------------------------------------
gem 'will_paginate', '~> 3.0.1'

#--[ Middleware ]---------------------------------------------------------------
gem 'rack-jsonp', '~> 1.2.0'


# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :development, :test do
  # -- [ IRB ] -----------------------------------------------------------------
  gem 'awesome_print'
  gem 'drx'
  gem 'wirble'
  gem 'utility_belt'

  # -- [ Tools ] ---------------------------------------------------------------
  gem 'rcov', :platform => :mri_18, :require => false
  gem 'simplecov', :platform => :mri_19, :require => false

  gem 'ruby-debug', :platform => :mri_18
  gem 'ruby-debug19', :platform => :mri_19

  gem 'annotate'
  gem "nifty-generators"

  gem 'guard-rspec'
  gem 'rspec-rails', '>= 2.6.0'
  gem 'guard-spork'
  gem 'spork-rails'
end

group :test, :darwin do
  gem 'rb-fsevent'
  gem 'growl'
end


group :test do
  # -- [ Testing ] -------------------------------------------------------------
  gem "mocha"
  gem "fakeweb"
  gem "factory_girl_rails"
  gem 'faker', '>= 1.0'
  gem 'uuid'
  gem 'steak', '2.0.0'
  gem 'capybara-json'
  # gem 'capybara-envjs'
  gem 'launchy'
  gem 'database_cleaner'
  gem 'spork'
end

#--[ API ]------------------------------------------------------------------
gem 'rabl-rails'

#--[ Storage-external logs ]------------------------------------------------------------------
gem 'airbrake'
gem 'aws-s3'
gem 'aws-sdk'