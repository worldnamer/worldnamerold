class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name
      t.string :section_type
      t.references :project, index: true
    end
  end
end
