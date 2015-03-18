require 'rails_helper'

describe User do
  subject { create(:worldnamer) }

  it 'has many projects' do
    expect(subject.projects.count).to be 0
  end

  it 'has many goals' do
    expect(subject.goals.count).to be 0
  end
end