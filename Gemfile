source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'rails', '~> 5.2.0'
gem 'puma', '~> 3.11'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'rack-cors'

gem 'jwt', '~> 2.1.0'
gem 'mongoid', '~> 7.0.1'
gem 'rails-i18n', '~> 5.1'
gem 'tty-spinner'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'dotenv-rails', '~> 2.5.0'
  gem 'factory_bot_rails'
  gem 'ffaker'
  gem 'pry-rails'
  gem 'rb-readline'
  gem 'rspec-rails', '~> 3.8'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop', '~> 0.58.2', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'database_cleaner'
  gem 'mongoid-rspec'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
