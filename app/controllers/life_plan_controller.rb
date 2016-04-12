class LifePlanController < ApplicationController
  def index
    @why = WhyStatement.first_or_create

    @life_areas = LifeArea.all.order(:name)

    @goals = current_user.goals.includes(:term, :life_area).where(completed: false)
    @goals = @goals.group_by { |goal| goal.term }
    @goals.each_pair { |term, goal_array| goal_array.sort_by! { |goal| goal.life_area.name } }
    @goals = @goals.sort_by { |term, goals| term.days }.reverse!
  end
end