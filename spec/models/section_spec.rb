require 'rails_helper'

describe Section do
  let(:user) { User.create(email: 'worldnamer@worldnamer.com', password: 'password', password_confirmation: 'password') }
  let(:project) { user.projects.create(name: 'A project', description: 'A description') }

  it 'destroys its todos when it is deleted' do
    section = project.sections.create(name: 'todos', section_type: 'todos')

    section.todos.create(description: 'Todo description', completed: false)

    section.destroy

    expect(Todo.count).to eq(0)
  end

  it 'destroys its links when it is deleted' do
    section = project.sections.create(name: 'links', section_type: 'links')

    section.links.create(title: 'Link description', excerpt: 'Link excerpt', url: 'example.com')

    section.destroy

    expect(Link.count).to eq(0)
  end
end