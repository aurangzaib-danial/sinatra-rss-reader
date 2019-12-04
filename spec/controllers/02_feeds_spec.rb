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

  

end