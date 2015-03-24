class TodosController < ApplicationController
  respond_to :html, :json

  before_filter :load_parent_project, only: [:new, :create]

  def new
  end

  def create
    @project.todos.create(description: params[:todo][:description])

    respond_with @todo, location: project_path(@project)
  end

  def update
    @todo = Todo.find(params[:id])

    if params[:todo][:completed] == 'true'
      @todo.complete! 
    else
      @todo.uncomplete!
    end

    render json: @todo
  end

  def load_parent_project
    @project = Project.find(params[:project_id])
  end
end