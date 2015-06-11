class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.belongs_to :user, index: true
      t.string :title
      t.string :excerpt
      t.string :url
      t.timestamps
    end
  end
end
