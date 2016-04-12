class CreateWhy < ActiveRecord::Migration
  def change
    create_table :why_statements do |t|
      t.string :contribution
      t.string :impact
    end
  end
end
