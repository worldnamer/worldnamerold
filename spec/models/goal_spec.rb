require 'rails_helper'

describe Goal do
  let(:heart_life_area) { LifeArea.create(name: 'heart') }
  it 'has a description' do
    goal = Goal.create(description: 'desc', life_area: heart_life_area)

    expect(goal).to be_valid
  end

  it 'belongs to a user' do
    user = User.create(email: 'worldnamer@worldnamer.com', password: 'password', password_confirmation: 'password')
    goal = Goal.create(description: 'desc', user: user, life_area: heart_life_area)

    expect(goal).to be_valid
  end

  it 'needs a life area' do
    user = User.create(email: 'worldnamer@worldnamer.com', password: 'password', password_confirmation: 'password')
    goal = Goal.create(description: 'desc', user: user)

    expect(goal).to_not be_valid
  end
end