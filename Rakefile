require_relative './config/environment'
require 'sinatra/activerecord/rake'

desc 'Interactive console for models' 
task :console do
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  Pry.start
end

def reload
  load_all 'app/models'
end

desc 'reset database'
task :reset do
  # User.destroy_all
  Article.destroy_all
  Feed.destroy_all
end