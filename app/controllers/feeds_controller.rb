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

  get '/feeds/:feed_id/articles' do
    @feed = Feed.find_by_id(params[:feed_id])
    if @feed && @feed.user_id == session[:user_id]
      @articles = @feed.articles

      erb :'articles/index.html'
    else
      redirect '/feeds'
    end
  end

end