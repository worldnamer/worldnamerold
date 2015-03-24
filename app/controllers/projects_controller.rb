class ProjectsController < ApplicationController
  respond_to :html, :json

  before_filter :load_project, only: [:show, :destroy, :update]

  def index
    @projects = current_user.projects
  end

  def new
    @project = Project.new
  end

  def create
    respond_with current_user.projects.create(params[:project].permit([:name, :description]))
  end

  def show
  end

  def destroy
    @project.destroy if @project

    respond_with @project
  end

  def update
    @project.update_attributes(params.require(:project).permit(:name, :description))
    respond_with @project
  end

  private

  def load_project
    @project = Project.find(params[:id])
  end
end
