class AddGoalIcon < ActiveRecord::Migration
  def change
    add_column :life_areas, :icon, :string
  end
end
