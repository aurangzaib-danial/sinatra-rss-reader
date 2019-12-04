describe 'Feeds' do

  it 'cannot access /feeds if not logged in' do

    get '/feeds'
    follow_redirect!
    
    expect(last_response.body).to include('About')
  end

  it 'cannot access /feeds/new if not logged in' do

    get '/feeds/new'
    follow_redirect!

    expect(last_response.body).to include('About')
  end

  it 'cannot post to /feeds if not logged in' do

    post '/feeds'
    follow_redirect!
    
    expect(last_response.body).to include('About')
  end

  it 'a feed articles cannot be accessed if it does not belong to the logged in user' do

    params = {
      email: 'aurangzaib.danial@gmail.com', 
      password: 'khan1234'
    }
    user_1 = User.create(params)
    user_2 = User.create(email: 'sunny@example.com', password: 'mypass12345')

    post '/login', params

    feed = Feed.create(title: 'Test Feed', user: user_2)

    get "/feeds/#{feed.id}/articles"
    follow_redirect!

    expect(last_response.body).to include('Feeds')

  end

  it 'an article of a feed cannot be accessed if the feed does not belong to the user' do
    params = {
      email: 'aurangzaib.danial@gmail.com', 
      password: 'khan1234'
    }
    user_1 = User.create(params)
    user_2 = User.create(email: 'sunny@example.com', password: 'mypass12345')

    post '/login', params

    feed = Feed.create(title: 'Test Feed', user: user_2)
    article = Article.create(feed: feed)

    get "/feeds/#{feed.id}/articles/#{article.id}"
    follow_redirect!

    expect(last_response.body).to include('Feeds')
  end


  it 'cannot delete if not logged in' do
    
    delete '/feeds/1' 
    follow_redirect!

    expect(last_response.body).to include('About')

  end

  it 'cannot delete feed if it does not belong to the current user' do

    params = {
      email: 'aurangzaib.danial@gmail.com', 
      password: 'khan1234'
    }
    user_1 = User.create(params)
    user_2 = User.create(email: 'sunny@example.com', password: 'mypass12345')

    post '/login', params

    feed = Feed.create(title: 'Test Feed', user: user_2)
    
    delete '/feeds/1'
    follow_redirect!

    expect(last_response.body).to include('About')
  end

  it 'can delete feed if it belongs to the current user' do
    params = {
      email: 'aurangzaib.danial@gmail.com', 
      password: 'khan1234'
    }
    user = User.create(params)

    post '/login', params

    feed = Feed.create(user: user)

    delete "/feeds/#{feed.id}"

    expect(Feed.exists?(feed.id)).to be_falsey

  end

end