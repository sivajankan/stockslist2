source 'https://rubygems.org'

ruby "2.0.0"

rails_version = ENV["RAILS_VERSION"] || "default"

rails = case rails_version
when "default"
  #">= 3.1.0"
  "4.0.0"
else
  "~> #{rails_version}"
end

gem "rails", rails
#gem "rails", '4.0.0'
gem 'yahoofinance'
gem 'market_beat'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'haml-rails'
#gem 'newrelic_rpm'
gem 'pg'
gem 'twitter-bootstrap-rails', '2.0.2'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  #gem 'sass-rails',   '~> 3.2.3'
  #gem 'coffee-rails', '~> 3.2.1'
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'jquery-rails', '~> 2.3.0'
  #gem 'jquery_datepicker', '~> 0.4'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platform => :ruby

  gem 'uglifier', '>= 1.0.3'
  gem 'bootstrap-sass', '2.1.1.0'
end

group :development, :test do
  gem 'debugger'
  gem 'rspec-rails'
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
  gem 'capybara', '2.0.1'
  gem 'selenium-webdriver'
  gem 'launchy'
  gem 'fabrication'
  gem 'simplecov'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'sqlite3'
end

group :test do
  gem "guard-rspec"
end

group :production do
  gem 'rails_12factor'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
