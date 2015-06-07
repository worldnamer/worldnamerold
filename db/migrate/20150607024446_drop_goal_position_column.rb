class DropGoalPositionColumn < ActiveRecord::Migration
  def change
    remove_column :goals, :position
  end
end
