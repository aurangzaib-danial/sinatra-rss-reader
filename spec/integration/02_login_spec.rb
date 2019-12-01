describe 'Login' do
  it 'login form on submit, successfully logs in' do
    params = {
      email: 'aurangzaib.danial@gmail.com', 
      password: 'khan1234'
    }
    User.create(params)
    
    post '/login', params

    expect(last_response.location).to include('/')
  end

  it 'cannot visit /login if already logged in' do
    params = {
      email: 'aurangzaib.danial@gmail.com', 
      password: 'khan1234'
    }
    User.create(params)
    
    post '/login', params

    get '/login'

    expect(last_response.location).to include('/')
  end
end