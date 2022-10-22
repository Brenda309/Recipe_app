require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.new(name: 'Anyone', email: 'email@email.com', password: '123456')
  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end
  it 'User name must be Anyone' do
    expect(user.name).to eq('Anyone')
  end
  it 'User email must be email@email.com' do
    expect(user.email).to eq('email@email.com')
  end
  it 'User password must not be 123456' do
    expect(user.email).to_not eq('123456')
  end
end
