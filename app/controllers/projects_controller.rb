class ProjectsController < ApplicationController
  respond_to :html

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
end
