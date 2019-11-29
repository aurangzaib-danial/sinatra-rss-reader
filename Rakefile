require_relative './config/environment'
require 'sinatra/activerecord/rake'

desc 'Interactive console for models' 
task :console do
  Pry.start
end

def reload
  load_all 'app/models'
end