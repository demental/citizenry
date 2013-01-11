Citizenry installation guide on Heroku
======================================

Prepare
-------

Get an heroku account.

Development
-----------

See INSTALL.md for more information about local development environment

Installation
------------

1. Clone this repository to a private one. This needs to be done as some sensitive data will be added. Best would be to use an ENV based logic, with the help of [Figaro](https://github.com/laserlemon/figaro) for example, feel free to contribute !
1. cd to your local repo and create an heroku app

  heroku create cityzentest --stack=cedar

1. Remove config/settings.yml from .gitignore

1. Copy the sample application settings into place:

  cp config/settings-sample.yml config/settings.yml

1. Configure the application settings in the `config/settings.yml` file as needed, see the instructions in the `config/settings-sample.yml` file for details.

1. Push to heroku

  git push heroku master

1. Migrate database

  heroku run rake db:migrate

1. Tell your friends !

Note: now that heroku repo has a master branch, you just need to git push heroku for the next updates