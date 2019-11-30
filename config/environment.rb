require 'bundler'
require 'open-uri' #=> For RSS

Bundler.require(:default, :development)

configure :development do
  set :database, 'sqlite3:db/development.sqlite'
end

# Extend Simple RSS to include enclosure tag attributes
SimpleRSS.item_tags << :"enclosure#url"
SimpleRSS.item_tags << :"enclosure#type"


require_all 'app'