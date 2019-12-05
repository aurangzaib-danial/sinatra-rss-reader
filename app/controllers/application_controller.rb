class ApplicationController < Sinatra::Base
  use Rack::Flash
  
  before do
    @title = 'Catchup!'
  end  

  enable :sessions

  set :views, 'app/views'
  set :public, 'app/public'
  
  configure :development do
    set :session_secret, 'only_for_development'
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