class ApplicationController < Sinatra::Base

  before do
    @title = 'Catchup!'
  end  
  
  configure do
    enable :sessions
    set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(64) }
    set :views, 'app/views'
  end

  get '/' do
    erb :'index.html'
  end


  helpers do
    def logged_in?
      !!session[:user_id]
    end
  end
end