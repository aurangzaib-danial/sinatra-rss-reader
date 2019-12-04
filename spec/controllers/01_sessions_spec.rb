describe 'Login' do
  it 'login form on submit, successfully logs in' do
    params = {
      email: 'aurangzaib.danial@gmail.com', 
      password: 'khan1234'
    }
    User.create(params)
    
    post '/login', params
    
    follow_redirect!

    expect(last_response.body).to include('About')
  end

  it 'cannot visit /login if already logged in' do
    params = {
      email: 'aurangzaib.danial@gmail.com', 
      password: 'khan1234'
    }
    User.create(params)
    
    post '/login', params

    get '/login'
    
    follow_redirect!

    expect(last_response.body).to include('About')
  end
end

describe 'Signup' do
  it 'signup form on submit creates the user and redirects to root' do
    params = {
      email: 'aurangzaib.danial@gmail.com',
      password: 'khan1234'
    }

    post '/signup', params
    follow_redirect!

    expect(User.last.email).to eq('aurangzaib.danial@gmail.com')

    expect(last_response.body).to include('About')
  end

  it 'cannot visit /signup after signup' do
    params = {
      email: 'aurangzaib.danial@gmail.com',
      password: 'khan1234'
    }

    post '/signup', params
    
    get '/signup'
    follow_redirect!
    expect(last_response.body).to include('About')
  end

end