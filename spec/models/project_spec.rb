require 'rails_helper'

describe Project do
  subject { Project.new }

  it 'has a name' do
    subject.name = 'Test'
  end

  it 'has a description' do
    subject.description = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fuga, officiis sunt neque facilis culpa molestiae necessitatibus delectus veniam provident.'
  end

  it 'has snippets' do
    subject.snippets << Snippet.new
  end

  it 'belongs to a user' do
    subject.user = User.create
  end

  it 'has todos' do
    subject.todos << Todo.new
  end

  it 'sorts todos by completed, then incomplete' do
    subject.save
    bar = subject.todos.create(description: 'bar', completed: false)
    foo = subject.todos.create(description: 'foo', completed: true)

    expect(subject.reload.todos).to eq([foo, bar])
  end
end