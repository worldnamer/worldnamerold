require 'rails_helper'

describe Project do
  subject { Project.new }

  it 'has a name' do
    subject.name = 'Test'
  end

  it 'has a description' do
    subject.description = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fuga, officiis sunt neque facilis culpa molestiae necessitatibus delectus veniam provident.'
  end

  it 'belongs to a user' do
    subject.user = User.create
  end

  it 'destroys its sections when it is deleted' do
    subject.save
    section = subject.sections.create(name: 'links', section_type: 'links')

    subject.destroy

    expect(Section.count).to eq(0)
  end
end