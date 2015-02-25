require 'rails_helper'

describe Snippet do
  subject { Snippet.new }

  it 'has a title' do
    subject.title = 'Title'
  end

  it 'has an excerpt' do
    subject.excerpt = 'Innovative technology must couple with solid storytelling to be effective, professor says at USC forum by Ryan Gilmour January 23, 2015 Tom Cruise stars in the 2002 film Minority Report. (Photo/Industrial Light & Magic) One...'
  end

  it 'has a url' do
    subject.url = 'http://localhost:3000/projects/2/snippets/1'
  end

  it 'belongs to a project' do
    subject.project = Project.new
  end
end
