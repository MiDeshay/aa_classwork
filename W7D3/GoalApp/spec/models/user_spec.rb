require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(
    username: 'Eli',
    email: 'eli@capy.com',
    password: 'password',
  ) }

  it {should validate_presence_of(:username)}
end
