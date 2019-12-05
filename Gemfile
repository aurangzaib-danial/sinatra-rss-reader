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

gem 'pry', group: [:development, :test]
gem 'sqlite3', group: [:development, :test]

group :development do
  gem 'shotgun'
  gem 'tux'
  gem 'rake'
end

group :test do
  gem 'rspec'
  gem 'rack-test'
  gem 'database_cleaner'
end