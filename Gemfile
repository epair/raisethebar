source 'https://rubygems.org/'
ruby "2.2.3"

gem 'rails', '4.2.5'
gem 'pg', '~> 0.15'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'foundation-rails'
gem 'devise'
gem 'carrierwave'
gem 'file_validators'
gem 'fog'
gem 'puma'

group :development, :test do
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'rspec-rails', '~> 3.0'
  gem 'pry-rails'
  gem 'shoulda-matchers'
  gem 'valid_attribute'
  gem 'dotenv-rails'
  gem 'database_cleaner'
  gem 'selenium-webdriver'
  gem 'capybara-webkit'
end

group :development do
  gem 'mailcatcher'
end

group :test do
  gem 'launchy', require: false
  gem 'coveralls', require: false
end

group :production do
  gem 'rails_12factor'
end
