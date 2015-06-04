class GoalsController < ApplicationController
  respond_to :html

  before_filter :load_user_goals, only: [:index, :sort]
  add_flash_types :error

  def index
  end

  def new
    @goal = Goal.new
  end

  def create
    goal_params = params.require(:goal).permit(:description, :life_area, :term)
    goal = Goal.create(
      description: goal_params[:description], 
      life_area: LifeArea.find(goal_params[:life_area]), 
      term: Term.find(goal_params[:term]),
      user: current_user
    )
    
    if goal.valid?
      respond_with goal, location: goals_path
    else
      flash.now[:error] = goal.errors.full_messages.first
      @goal = Goal.new
      render 'new'
    end
  end

  def destroy
    goal = Goal.find(params[:id])
    goal.destroy

    respond_with goal, location: goals_path
  end

  def sort
    goal_indexes = params.require(:goal)

    @goals.each do |goal|
      goal.position = goal_indexes.index("#{goal.id}") + 1 # acts_as_list uses 1-based indexing
      goal.save!
    end

    head :no_content
  end

  private

  def load_user_goals
    @goals = current_user.goals
  end
end