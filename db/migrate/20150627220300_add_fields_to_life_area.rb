class AddFieldsToLifeArea < ActiveRecord::Migration
  def change
    add_column :life_areas, :identity, :string
    add_column :life_areas, :vision, :string
    add_column :life_areas, :purpose, :string
  end
end
