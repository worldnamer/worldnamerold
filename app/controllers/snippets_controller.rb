class SnippetsController < ApplicationController
  respond_to :html

  before_filter :load_parents, only: [:new, :create, :destroy]

  def new
    @snippet = Link.new
  end

  def create
    link_params = params.require(:link).permit([:title, :excerpt, :url])
    link_params.merge!({user: current_user})
    
    @section.links.create(link_params)

    respond_with @project
  end

  def destroy
    @snippet = Link.find(params[:id])

    @snippet.destroy if @section == @snippet.linkable

    respond_with @project
  end

  private

  def load_parents
    @project = Project.find(params[:project_id])
    @section = Section.find(params[:section_id])
  end
end