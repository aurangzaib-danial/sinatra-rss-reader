class FeedsController < ApplicationController
  before do
    redirect '/' unless logged_in?
  end

  get '/feeds' do
    @title = 'Feeds'
    erb :'feeds/index.html'
  end

  get '/feeds/new' do
    @title = 'New Feed'
    erb :'feeds/new.html'
  end

  post '/feeds' do
    feed = Feed.new_from_rss_link(link: params[:feed_link], user_id: session[:user_id])
    if feed
      feed.save
      redirect "/feeds/#{feed.id}/articles"
    else
      flash[:error] = "You've entered a bad link."
      redirect '/feeds/new'
    end
  end

end