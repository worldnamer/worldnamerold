class ProjectsController < ApplicationController
  respond_to :html, :json

  def index
    @projects = current_user.projects
  end

  def new
    @project = Project.new
  end

  def create
    project = Project.new(
      name: params[:project][:name],
      description: params[:project][:description],
      user: current_user
    )
    project.save!
    respond_with project
  end

  def show
    @project = Project.find(params[:id])
  end

  def destroy
    @project = Project.find(params[:id])

    @project.destroy if @project

    respond_with @project
  end

  def update
    @project = Project.find(params[:id])

    @project.update_attributes(params.require(:project).permit(:name, :description))
    respond_with @project
  end
end
