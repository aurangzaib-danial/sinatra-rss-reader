class ApplicationController < Sinatra::Base

  before do
    @title = 'Catchup!'
  end

  configure do 
    set :views, 'app/views'
  end

  get '/' do
    erb :'index.html'
  end
end