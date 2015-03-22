class TodosController < ApplicationController
  respond_to :html, :json

  def new
    @todo = Todo.new
    @project = Project.find(params[:project_id])
  end

  def create
    @project = Project.find(params[:project_id])
    @project.todos.create(description: params[:todo][:description])

    respond_with @todo, location: project_path(@project)
  end

  def update
    @todo = Todo.find(params[:id])
    @project = Project.find(params[:project_id])

    completed = params[:todo][:completed] == 'true'
    if completed
      @todo.complete! 
    else
      @todo.uncomplete!
    end

    render json: @todo
  end
end