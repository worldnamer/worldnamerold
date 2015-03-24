class SnippetsController < ApplicationController
  respond_to :html

  before_filter :load_project, only: [:new, :create, :destroy]

  def new
    @snippet = Snippet.new
  end

  def create
    @project.snippets.create(params[:snippet].permit([:title, :excerpt, :url]))

    respond_with @project
  end

  def destroy
    @snippet = Snippet.find(params[:id])

    @snippet.destroy if @project == @snippet.project

    respond_with @project
  end

  private

  def load_project
    @project = Project.find(params[:project_id])
  end
end