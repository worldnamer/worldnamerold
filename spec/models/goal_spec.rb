require 'rails_helper'

describe Goal do
  it 'has a description' do
    Goal.create(description: 'desc')
  end
end