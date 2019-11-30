ENV['APP_ENV'] ||= 'development'

require 'bundler'
require 'open-uri' #=> For RSS
require 'securerandom'

Bundler.require(:default, ENV['APP_ENV'])

configure :development do
  set :database, 'sqlite3:db/development.sqlite'
end

configure :test do
  set :database, 'sqlite3:db/test.sqlite'
end


# Extend Simple RSS to include enclosure tag attributes
SimpleRSS.item_tags << :"enclosure#url"
SimpleRSS.item_tags << :"enclosure#type"


require_all 'app'