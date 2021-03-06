source 'https://rubygems.org'

ruby '2.2.4'

#========== GLOBAL GEMS ======================
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5.1'
#-------------------------------------------
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
#-------------------------------------------
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
#-------------------------------------------
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
#-------------------------------------------
# Use jquery as the JavaScript library
gem 'jquery-rails'
#-------------------------------------------
# Turbolinks makes following links in your web application faster.
#   Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
#-------------------------------------------
# Use Twitter Bootstrap 4 (4.0.0.alpha3?) as CSS framework
# gem 'bootstrap'
#------------------------------------------
# Use Twitter Bootstrap 3 as CSS framework
gem 'bootstrap-sass'
#-------------------------------------------
# per: http://www.sitepoint.com/devise-authentication-in-depth/
# If you are using Bootstrap's dropdown menu. Dropdown relies on JavaScript code
# and, using Turbolinks, it won't be executed correctly when navigating between
# pages. Use jquery-turbolinks to fix this:
gem 'jquery-turbolinks'
#--------------------------------------------
# Use Figaro to store Sendgrid and Devise credentials as environment variables.
#     Doc - Bloc: https://www.bloc.io/resources/environment-variables-with-figaro
#     GitHub - https://github.com/laserlemon/figaro#give-me-an-example
gem 'figaro', '1.0'
#-------------------------------------------
# Use Pry as alternative Rails console shell (alternative to IRB)
# To use: add    " require 'pry' " at head of file.
#         insert " binding.pry " in the code to where you want the breakpoint.
gem 'pry'
#-------------------------------------------
# Use Devise authentication
gem 'devise'
#-------------------------------------------
# Add Devise support for oauth using omniauth
# per: https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview
# Add omniauth strategy for Facebook
# per: https://github.com/mkdynamic/omniauth-facebook
gem 'omniauth-facebook'
#-------------------------------------------
# Add omniauth strategy for Slack
# per: https://github.com/kmrshntr/omniauth-slack
gem 'omniauth-slack'
#-------------------------------------------
# Use Pundit authorization
gem 'pundit'
#-------------------------------------------
# Generate data for seeding database.
gem 'faker'
#-------------------------------------------
# Use Chartkick for displaying graphs
gem 'chartkick'
#-------------------------------------------
# Use GroupDate to create a line chart of events over time.
# Note: requires that Chartkick be installed.
gem 'groupdate'
#-------------------------------------------
# use postgre SQL db server for Active Record
gem 'pg'
#--------------------------------------------
#
#============== DEVELOPMENT only GEMS =================
group :development do
  # Use sqlite3 as the SQL db server for Active Record in development/local OSX
  # machine.
  # Note: not supported by GroupDate gem for graphs. Use postgre instead.
  # gem 'sqlite3'
  #-------------------------------------------
  gem 'web-console', '~> 2.0'
end

#
#============ DEVELOPMENT, TEST only GEMS =============
group :development, :test do
  gem 'byebug'
  #-------------------------------------------
  gem 'spring'
  #-------------------------------------------
  gem 'rspec-rails'
  #-------------------------------------------
  # Rspec extension that add "shoulda" test syntax.
  # To use: ??
  gem 'shoulda'
  #-------------------------------------------
  gem 'factory_girl_rails'
end

#
#=========== PRODUCTION only GEMS =================
group :production do
  # use postgre SQL db server for Active Record in production (Heroku)
  # deployment
  # Note: now using postgre in dev system/OSX.
  # gem 'pg'
  #-------------------------------------------
  # Rails 4 requires some minor configuration changes to properly serve assets
  # on Heroku
  gem 'rails_12factor'
  #-------------------------------------------
end
