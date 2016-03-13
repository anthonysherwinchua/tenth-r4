source 'https://rubygems.org'
ruby '2.3.0'

gem 'rails', '4.2.6'

# Database
gem 'pg', '~> 0.15'

# Web server
gem 'puma'

# Authentication
gem 'devise'

# View rendering
gem 'slim-rails'

# Form builders & helpers
gem 'simple_form'

# Asset pipeline
gem 'sassc-rails'
gem 'coffee-rails', '~> 4.1.0'
gem 'uglifier', '>= 1.3.0'

# Front-end
gem 'bootstrap-sass', '~> 3.3.6'
gem 'devise-bootstrap-views'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'select2-rails'
gem 'turbolinks'
gem 'font-awesome-rails'

# Background worker
gem 'sidekiq'

# 3rd party services
gem 'aws-sdk', '~> 2'

group :development, :test do
  gem 'byebug'
  gem 'dotenv-rails'
  gem 'rspec-rails', '~> 3.0'
  gem 'factory_girl_rails'
  gem 'pry-rails'
end

group :development do
  gem 'rubocop', require: false
  gem 'quiet_assets'
end

group :test do
  gem 'shoulda-matchers', '~> 3.1'
  gem 'database_cleaner'
end
