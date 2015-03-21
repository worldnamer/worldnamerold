class CreateTodosTable < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :description
      t.references :project, index: true
    end
  end
end
