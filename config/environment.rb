ENV['RACK_ENV'] ||= 'development'

require 'bundler'
require 'open-uri' #=> For RSS

Bundler.require(:default, ENV['RACK_ENV'])

require 'rack-flash'

configure :development do
  set :database, 'sqlite3:db/development.sqlite'
end

configure :test do
  set :database, 'sqlite3:db/test.sqlite'
end


# Extend Simple RSS to include enclosure tag attributes
SimpleRSS.item_tags << :"enclosure#url"
SimpleRSS.item_tags << :"enclosure#type"
SimpleRSS.feed_tags << :url # Lives in image tag of channel, points to image url


require_all 'app'