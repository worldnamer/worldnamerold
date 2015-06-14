class SectionsController < ApplicationController
  respond_to :html, :json

  before_filter :load_project, only: [:new, :create, :destroy]

  def new
    @project = Project.find(params[:project_id])
    @section = Section.new
  end

  def create
    @project = Project.find(params[:project_id])
    section_params = params.require(:section).permit(:name, :section_type)
    section = @project.sections.create(name: section_params[:name], section_type: section_params[:section_type])
    
    respond_with section, location: project_path(@project)
  end

  def destroy
    @section = Section.find(params[:id])

    @section.destroy if @project == @section.project

    respond_with @project
  end

  def update
    @section = Section.find(params[:id])
    @section.update_attributes(params.require(:section).permit(:name))
    respond_with @section
  end

  private

  def load_project
    @project = Project.find(params[:project_id])
  end
end