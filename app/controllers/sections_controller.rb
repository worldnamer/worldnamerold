class SectionsController < ApplicationController
  respond_to :html

  before_filter :load_project, only: [:new, :create, :destroy]

  def new
    @project = Project.find(params[:project_id])
    @section = Section.new
  end

  def create
    @project = Project.find(params[:project_id])
    section_params = params.require(:section).permit(:name, :section_type)
    # section = Section.create(
    #   description: goal_params[:description], 
    #   life_area: LifeArea.find(goal_params[:life_area]), 
    #   term: Term.find(goal_params[:term]),
    #   user: current_user
    # )
    section = @project.sections.create(name: section_params[:name], section_type: section_params[:section_type])
    
    respond_with section, location: project_path(@project)
  end

  def destroy
    @project = Project.find(params[:project_id])
    @section = Section.find(params[:id])

    @section.destroy if @project == @section.project

    respond_with @project
  end

  private

  def load_project
    @project = Project.find(params[:project_id])
  end
end