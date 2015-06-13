class SectionsController < ApplicationController
  respond_to :html

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
end