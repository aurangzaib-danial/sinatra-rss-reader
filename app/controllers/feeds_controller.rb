class FeedsController < ApplicationController

  get '/feeds' do
    redirect '/' unless logged_in?

    erb :'feeds/index.html'
  end

  get '/feeds/new' do
    redirect '/' unless logged_in?

    erb :'feeds/new.html'
  end

  post '/feeds' do
    raise params.inspect
  end

end