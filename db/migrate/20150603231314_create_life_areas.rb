class CreateLifeAreas < ActiveRecord::Migration
  def change
    create_table :life_areas do |t|
      t.string 'name'
    end

    add_column :goals, :life_area_id, :integer, required: true
  end
end
