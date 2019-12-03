class ApplicationController < Sinatra::Base
  use Rack::Flash
  
  before do
    @title = 'Catchup!'
  end  
  
  configure do
    enable :sessions
    set :session_secret, 'read_this_from_env_variable'
    set :views, 'app/views'
  end

  get '/' do
    erb :'index.html'
  end


  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      @current_user ||= User.find_by_id(session[:user_id])
    end
  end
end