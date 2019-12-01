class SessionsController < ApplicationController
  get '/signup' do
    redirect '/' if logged_in?

    @title = 'Signup!'

    erb :'sessions/signup.html'
  end


  post '/signup' do
    user = User.new(email: params[:email], password: params[:password])

    if user.save
      session[:user_id] = user.id
      redirect '/'
    else
      redirect '/signup'
    end
  end

  get '/login' do

  end

  post '/login' do

  end

end