source "https://rubygems.org"

ruby "2.1.2"

gem "coffee-rails"
gem "email_validator"
gem "flutie"
gem "i18n-tasks"
gem "jquery-rails"
gem "normalize-rails", "~> 3.0.0"
gem "pg"
gem "rails", "4.2.0.rc3"
gem "recipient_interceptor"
gem "sass-rails", "~> 4.0.3"
gem "simple_form"
gem "title"
gem "uglifier"
gem "unicorn"
gem "http-cookie"
gem 'importio'
gem 'slim'
gem 'sucker_punch'
gem 'httparty'
gem 'andand'
gem 'rack-timeout'
gem 'nokogiri'

gem "twitter-bootstrap-rails"
group :development do
  gem "spring"
  gem "spring-commands-rspec"
end

group :development, :test do
  gem "awesome_print"
  gem "byebug"
  gem "dotenv-rails"
  gem "factory_girl_rails"
  gem "pry-rails"
  gem 'pry-stack_explorer'
  gem "rspec-rails", "~> 3.0.0"
end

group :test do
  # gem "capybara-webkit", ">= 1.2.0"
  gem "database_cleaner"
  gem "formulaic"
  gem "launchy"
  gem "shoulda-matchers", require: false
  gem "timecop"
  gem "webmock"
end

group :staging, :production do
  gem 'rails_12factor'
  gem "newrelic_rpm", ">= 3.7.3"
end
