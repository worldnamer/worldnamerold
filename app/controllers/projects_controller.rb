class ProjectsController < ApplicationController
  respond_to :html

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    project = Project.new(name: params[:project][:name])
    project.save!
    respond_with project
  end

  def show
  end
end
