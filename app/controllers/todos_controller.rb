class TodosController < ApplicationController
  respond_to :html

  def new
    @todo = Todo.new
    @project = Project.find(params[:project_id])
  end

  def create
    @project = Project.find(params[:project_id])
    @project.todos.create(description: params[:todo][:description])

    respond_with @todo, location: project_path(@project)
  end
end