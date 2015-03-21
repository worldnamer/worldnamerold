require 'rails_helper'

describe TodosController do
  context '#create' do
    it 'creates a new todo' do
      project = create(:project)

      post :create, project_id: project.id, todo: {description: 'test description'}

      expect(Todo.count).to eq(1)
    end
  end
end