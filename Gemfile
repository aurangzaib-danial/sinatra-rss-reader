# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

# gem "rails"

gem 'activerecord', '5.2.3', require: 'active_record'
gem 'require_all'
gem 'rack'
gem 'sinatra'
gem 'sinatra-activerecord'
gem 'simple-rss'
gem 'bcrypt'
gem 'rack-flash3'

group :development, :production do
  gem 'rake'
end

group :production do

end

group :development, :test do
  gem 'pry'
  gem 'sqlite3'
end

group :development do
  gem 'shotgun'
  gem 'tux'
end

group :test do
  gem 'rspec'
  gem 'rack-test'
  gem 'database_cleaner'
end