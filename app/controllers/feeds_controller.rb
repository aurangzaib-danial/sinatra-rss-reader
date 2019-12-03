class FeedsController < ApplicationController

  get '/feeds' do
    redirect '/' unless logged_in?

    erb :'feeds/index.html'
  end



end