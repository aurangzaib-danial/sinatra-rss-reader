describe 'Feeds' do

  it 'cannot access /feeds if not logged in' do
    get '/feeds'
    expect(last_response.location).to include('/')
  end

end