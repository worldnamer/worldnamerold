class CreateGoalTable < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :description
    end
  end
end
