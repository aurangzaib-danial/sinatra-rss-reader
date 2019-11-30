class SessionsController < ApplicationController
  get '/signup' do
    @title = 'Signup!'
    erb :'sessions/signup.html'
  end

  
end