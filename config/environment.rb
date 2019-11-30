ENV['SINATRA_ENV'] ||= 'development'

APP_ENV = ENV['SINATRA_ENV']

require 'bundler'
require 'open-uri' #=> For RSS

Bundler.require(:default, APP_ENV.to_sym)

configure APP_ENV.to_sym do
  set :database, "sqlite3:db/#{APP_ENV}.sqlite"
end

# Extend Simple RSS to include enclosure tag attributes
SimpleRSS.item_tags << :"enclosure#url"
SimpleRSS.item_tags << :"enclosure#type"


require_all 'app'