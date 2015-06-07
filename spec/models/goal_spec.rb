require 'rails_helper'

describe Goal do
  let(:heart_life_area) { LifeArea.create(name: 'heart') }
  let(:month_term) { Term.create(name: 'this month') }
  let(:user) { User.create(email: 'worldnamer@worldnamer.com', password: 'password', password_confirmation: 'password') }

  it 'belongs to a user' do
    goal = Goal.create(description: 'desc', user: user, life_area: heart_life_area, term: month_term)

    expect(goal).to be_valid
  end

  it 'needs a life area' do
    goal = Goal.create(description: 'desc', user: user, term: month_term)

    expect(goal).to_not be_valid
  end

  it 'needs a term' do
    goal = Goal.create(description: 'desc', user: user, life_area: heart_life_area)

    expect(goal).to_not be_valid
  end

  it 'has a completed flag' do
    goal = Goal.create(description: 'desc', user: user, life_area: heart_life_area, term: month_term)

    expect(goal).to_not be_completed
  end

  it 'can be completed' do
    goal = Goal.create(description: 'desc', user: user, life_area: heart_life_area, term: month_term)

    goal.complete!

    expect(goal).to be_completed
  end
end