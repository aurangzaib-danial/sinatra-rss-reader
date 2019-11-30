describe 'Signup' do
  it 'signup form on submit creates the user and redirects to root' do
    params = {
      email: 'aurangzaib.danial@gmail.com',
      password: 'khan1234'
    }

    post '/signup', params

    expect(User.last.email).to eq('aurangzaib.danial@gmail.com')

    expect(last_response.location).to include('/')
  end

  it 'cannot visit /signup after signup' do
    params = {
      email: 'aurangzaib.danial@gmail.com',
      password: 'khan1234'
    }

    post '/signup', params
    
    get '/signup'
    expect(last_response.location).to include('/')
  end

end