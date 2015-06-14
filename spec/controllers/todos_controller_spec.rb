require 'rails_helper'

describe TodosController do
  context '#create' do
    it 'creates a new todo' do
      project = create(:project)
      section = project.sections.create(name: 'todos', section_type: 'todos')

      post :create, project_id: project.id, section_id: section.id, todo: {description: 'test description'}

      expect(Todo.count).to eq(1)
    end
  end

  context '#update' do
    it 'completes the todo' do
      project = create(:project)
      section = project.sections.create(name: 'todos', section_type: 'todos')
      todo = section.todos.create(description: 'test this todo', completed: false)

      post :update, project_id: project.id, section_id: section.id, id: todo.id, todo: {completed: 'true'}

      expect(todo.reload.completed?).to eq(true)
    end

    it 'uncompletes the todo' do
      project = create(:project)
      section = project.sections.create(name: 'todos', section_type: 'todos')
      todo = section.todos.create(description: 'test this todo', completed: true)

      post :update, project_id: project.id, section_id: section.id, id: todo.id, todo: {completed: 'false'}

      expect(todo.reload.completed?).to eq(false)
    end
  end
end