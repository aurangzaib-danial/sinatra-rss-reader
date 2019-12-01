class SessionsController < ApplicationController
  get '/signup' do
    redirect '/' if logged_in?

    @title = 'Signup'

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
    redirect '/' if logged_in?

    @title = 'Login'

    erb :'sessions/login.html'
  end

  post '/login' do
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id

      redirect '/'
    else
      redirect '/login'
    end
  end

  get '/logout' do
    redirect '/' if logged_in?
    session.clear
    redirect '/'
  end

end