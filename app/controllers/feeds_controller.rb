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
      if feed.save
        redirect "/feeds/#{feed.id}/articles"
      else
        flash[:error] = 'Feed already exists.'
        redirect '/feeds/new'
      end
    else
      flash[:error] = "You've entered a bad link."
      redirect '/feeds/new'
    end
  end

  get '/feeds/:feed_id/articles' do
    @feed = Feed.find_by_id(params[:feed_id])
    
    if @feed && @feed.user_id == session[:user_id]
      
      @articles = @feed.articles.select("id, title, image_link").order('published_date desc')

      erb :'articles/index.html'
      
    else
      redirect '/feeds'
    end

  end

  get '/feeds/:feed_id/articles/update' do
    feed = Feed.find_by_id(params[:feed_id])
    
    if feed && feed.user_id == session[:user_id]
      new_articles_count = feed.update_articles_and_return_count

      flash[:new_articles_count] = new_articles_count

      redirect "/feeds/#{feed.id}/articles"
    else
      redirect '/feeds'
    end
  end

  get '/feeds/:feed_id/articles/:article_id' do
    @feed = Feed.find_by_id(params[:feed_id])
    
    if @feed && @feed.user_id == session[:user_id]
      
      @article = @feed.articles.find_by_id(params[:article_id])

      if @article
        erb :'articles/show.html'
      else
        redirect "/feeds/#{params[:feed_id]}/articles"
      end

    else
      redirect '/feeds'
    end

  end

  delete '/feeds/:id' do
    feed = Feed.find_by_id(params[:id])

    if feed && feed.user_id == session[:user_id]
      feed.destroy
      feed.articles.destroy_all
      redirect '/feeds'
    else
      redirect '/'
    end
  end

end