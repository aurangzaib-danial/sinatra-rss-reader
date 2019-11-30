class SessionsController < ApplicationController
  get '/signup' do
    erb :'sessions/signup.html'
  end
end