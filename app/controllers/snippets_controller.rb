class SnippetsController < ApplicationController
  respond_to :html

  def new
    @project = Project.find(params[:project_id])
    @snippet = Snippet.new
  end

  def create
    @project = Project.find(params[:project_id])

    @project.snippets.create(
      title: params[:snippet][:title], 
      excerpt: params[:snippet][:excerpt], 
      url: params[:snippet][:url]
    )

    respond_with @project
  end
end