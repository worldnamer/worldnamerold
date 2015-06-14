class SnippetsController < ApplicationController
  respond_to :html

  before_filter :load_parents, only: [:new, :create, :destroy]

  def new
    @snippet = Snippet.new
  end

  def create
    @section.snippets.create(params.require(:snippet).permit([:title, :excerpt, :url]))

    respond_with @project
  end

  def destroy
    @snippet = Snippet.find(params[:id])

    @snippet.destroy if @section == @snippet.section

    respond_with @project
  end

  private

  def load_parents
    @project = Project.find(params[:project_id])
    @section = Section.find(params[:section_id])
  end
end