class SnippetsController < ApplicationController
  respond_to :html

  def new
    @project = Project.find(params[:project_id])
    @snippet = Snippet.new
  end

  def create
    @project = Project.find(params[:project_id])

    @project.snippets.create(params[:snippet].permit([:title, :excerpt, :url]))

    respond_with @project
  end

  def destroy
    @project = Project.find(params[:project_id])
    @snippet = Snippet.find(params[:id])

    @snippet.destroy if @project == @snippet.project

    respond_with @project
  end
end