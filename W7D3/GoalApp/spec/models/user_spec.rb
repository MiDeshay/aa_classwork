require 'rails_helper'

RSpec.describe User, type: :model do
subject(:user) { User.new(
    username: 'Eli',
    email: 'eli@capy.com',
    password: 'password',
    password_digest: 'g3nk4jgnbd8fgh3k4tn',
    session_token: '43kfjne98gvbj34gnsaeg'
  ) }
  
  it {should validate_presence_of(:username)}
  it {should validate_presence_of(:password_digest)}
  it {should validate_presence_of(:session_token)}
  it {should validate_presence_of(:email)}

  it {should validate_uniqueness_of(:username)}
  it {should validate_uniqueness_of(:session_token)}

  it {should validate_length_of(:password).is_at_least(6)}


  describe 'User::find_by_credentails' do
    context 'valid username and password'  do
      it 'should return the user ' do
        eli = User.find_by_credentails('Eli', 'password')
        expect(user.username).to eq(eli.username)
        expect(user.password_digest).to eq(eli.password_digest)
      end
    end
    context 'invalid username and password' do
      it 'should return nil' do
        expect(User.find_by_credentails('Garbage', 'password3')).to be_nil
      end
    end
  end
  
end
