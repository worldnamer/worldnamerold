class CreateTerm < ActiveRecord::Migration
  def change
    create_table :terms do |t|
      t.integer :days
      t.string :name
    end

    add_column :goals, :term_id, :integer, required: true

    # change_table(:goals) { |t| t.timestamps }
    add_timestamps :goals
  end
end
