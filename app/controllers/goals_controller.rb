class GoalsController < ApplicationController
  respond_to :html

  def index
    @goals = current_user.goals
  end

  def new
    @goal = Goal.new
  end

  def create
    goal = Goal.create(description: params[:goal][:description], user: current_user)
    
    respond_with goal, location: goals_path
  end

  def destroy
    goal = Goal.find(params[:id])
    goal.destroy

    respond_with goal, location: goals_path
  end
end