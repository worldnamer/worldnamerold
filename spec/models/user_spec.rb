require 'rails_helper'

describe User do
  it 'has many projects' do
    user = User.create(email: 'worldnamer@worldnamer.com', password: 'password', password_confirmation: 'password')
    expect(user.projects.count).to be 0
  end
end