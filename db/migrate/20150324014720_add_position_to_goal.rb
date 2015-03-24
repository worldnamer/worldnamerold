class AddPositionToGoal < ActiveRecord::Migration
  def change
    add_column :goals, :position, :integer
  end
end
