class LifeAreasController < ApplicationController
  respond_to :json
  
  def update
    @life_area = LifeArea.find(params[:id])

    @life_area.update_attributes(params.require(:life_area).permit([:identity, :vision, :purpose]))

    respond_with @life_area, location: life_plan_path
  end
end