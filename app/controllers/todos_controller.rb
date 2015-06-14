class TodosController < ApplicationController
  respond_to :html, :json

  before_filter :load_parents, only: [:new, :create]

  def new
  end

  def create
    @section.todos.create(description: params[:todo][:description])

    respond_with @todo, location: project_path(@project)
  end

  def update
    @todo = Todo.find(params[:id])

    @todo.completed = params.require(:todo)[:completed] == 'true'
    @todo.save!

    render json: @todo
  end

  def load_parents
    @project = Project.find(params[:project_id])
    @section = Section.find(params[:section_id])
  end
end