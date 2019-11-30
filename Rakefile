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
  system('rm -rf db/schema.rb')
  system('rm -rf db/development.sqlite')
  system('rake db:migrate')
end