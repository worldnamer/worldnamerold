require 'rails_helper'

describe LifeArea do
  subject(:life_area) { LifeArea.create(name: 'heart') }
  
  it 'has an identity' do
    subject.identity = 'Lorem ipsum.'
    subject.save
  end

  it 'has a vision' do
    subject.vision = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit'
    subject.save
  end

  it 'has a purpose' do
    subject.purpose = 'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
    subject.save
  end
end