class SessionsController < ApplicationController
  get '/signup' do
    @title = 'Signup!'

    erb :'sessions/signup.html'
  end


  post '/signup' do
    raise params.inspect
  end

end