describe User do

  it 'only allows strong password' do
    user = User.create(email: 'aurangzaib.danial@gmail.com', password: '123')
    
    expect(user.persisted?).to eq(false)
  end

  it 'only allows unique email address' do
    User.create(email: 'aurangzaib.danial@gmail.com', password: 'khan1234')
    User.create(email: 'aurangzaib.danial@gmail.com', password: 'khan1234')

    expect(User.where('email = ?', 'aurangzaib.danial@gmail.com').size).to eq(1)
  end

  it 'does not allow bad email address' do
    user = User.create(email: 'myemail@', password: 'khan1234')

    expect(user.persisted?).to eq(false)
  end
end