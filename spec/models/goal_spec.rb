require 'rails_helper'

describe Goal do
  it 'has a description' do
    Goal.create(description: 'desc')
  end

  it 'belongs to a user' do
    user = User.create(email: 'worldnamer@worldnamer.com', password: 'password', password_confirmation: 'password')
    Goal.create(description: 'desc', user: user)
  end
end