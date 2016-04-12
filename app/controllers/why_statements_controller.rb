class WhyStatementsController < ApplicationController
  respond_to :json
  
  def update
    @why = WhyStatement.find(params[:id])

    @why.update_attributes(params.require(:why_statement).permit([:impact, :contribution]))

    respond_with WhyStatement.first, location: life_plan_path
  end
end