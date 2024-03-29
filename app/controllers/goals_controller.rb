class GoalsController < ApplicationController
  respond_to :html, :json

  before_filter :load_user_goals, only: :index
  before_filter :load_goal, only: [:update, :destroy, :complete]
  add_flash_types :error

  def index
    # JWLL: Not in love with this - I'd rather do something clever in the DB sort, but I don't really want to think that hard right now. This in-memory
    # sort is still okay, because there should only be a few dozen (<100) of these to sort.
    @goals = @goals.group_by { |goal| goal.term }
    @goals.each_pair { |term, goal_array| goal_array.sort_by! { |goal| goal.life_area.name } }
    @goals = @goals.sort_by { |term, goals| term.days }.reverse!
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
      respond_with goal, location: life_plan_path
    else
      flash.now[:error] = goal.errors.full_messages.first
      @goal = Goal.new
      render 'new'
    end
  end

  def destroy
    @goal.destroy

    respond_with @goal, location: life_plan_path
  end

  def update
    @goal.update_attributes(params.require(:goal).permit(:description))
    respond_with @goal, location: life_plan_path
  end

  def complete
    @goal.complete

    respond_with @goal, location: life_plan_path
  end

  private

  def load_user_goals
    @goals = current_user.goals.includes(:term, :life_area).where(completed: false)
  end

  def load_goal
    @goal = Goal.find(params[:id])
  end
end