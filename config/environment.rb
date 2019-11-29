require 'bundler'
require 'open-uri' #=> For RSS

Bundler.require(:default, :development)

configure :development do
  set :database, 'sqlite3:db/development.sqlite'
end

require_all 'app'