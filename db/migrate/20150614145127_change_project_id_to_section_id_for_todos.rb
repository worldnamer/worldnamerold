class ChangeProjectIdToSectionIdForTodos < ActiveRecord::Migration
  def change
    add_column :todos, :section_id, :integer

    project_ids = Todo.select(:project_id).distinct.pluck(:project_id)

    project_ids.each do |project_id|
      section = Project.find(project_id).sections.create(name: 'Todos', section_type: 'todos')
      section.todos = Todo.where(project_id: project_id)
      section.save
    end

    remove_column :todos, :project_id
  end
end
