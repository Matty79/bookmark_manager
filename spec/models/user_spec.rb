require 'spec_helper'

describe User do

  let!(:user) do
    User.create(email: 'test@test.com', password: 'password',
                password_confirmation: 'password')

  end

  it 'authenticates when given a valid email and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate a user when given an incorrect password' do
    expect(User.authenticate(user.email, 'wrong_pword')).to be_nil
  end

end
