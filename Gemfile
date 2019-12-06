source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'data_migrate'
gem 'i18n-js'
gem 'jquery-rails'
gem 'puma', '~> 4.3'
gem 'rails', '~> 5.2.1'
gem 'rails-i18n'
gem 'rails_12factor'
gem 'recaptcha', require: 'recaptcha/rails'
gem 'uglifier'
gem 'turbolinks', '~> 5.2.0'

group :production do
  gem 'pg'
end

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3', '~> 1.3.6'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'dotenv-rails'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
# The email_address gem provides a ruby language library for working with email addresses
gem 'email_address'
