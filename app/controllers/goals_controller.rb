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

  def sort
    current_user.goals.each do |goal|
      goal.position = params[:goal].index(goal.id.to_s) + 1
      goal.save
    end
    head :no_content
  end
end