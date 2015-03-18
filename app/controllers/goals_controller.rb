class GoalsController < ApplicationController
  respond_to :html

  def index
    @goals = Goal.all
  end

  def new
    @goal = Goal.new
  end

  def create
    goal = Goal.create(description: params[:goal][:description])
    
    respond_with goal, location: goals_path
  end
end