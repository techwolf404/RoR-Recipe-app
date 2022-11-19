require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user = User.new(
      name: 'John Doe',
      email: 'test@gmail.com',
      password: 'password',
      password_confirmation: 'password'
    )
  end

  it 'should be valid' do
    expect(@user).to be_valid
  end

  it 'user should have name' do
    @user.name = 'John Doe'
    expect(@user).to be_valid
  end

  it 'user should have email' do
    @user.email = 'test@gmail.com'
    expect(@user).to be_valid
  end

  it 'user should have password' do
    @user.password = 'password'
    expect(@user).to be_valid
  end

  it 'user should have password confirmation' do
    @user.password_confirmation = 'password'
    expect(@user).to be_valid
  end
end
