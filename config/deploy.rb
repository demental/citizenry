server 'yourapp.com', :app, :web, :db, :primary => true

        require './config/boot'
        require 'airbrake/capistrano'
