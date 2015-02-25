class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.belongs_to :project, index: true
      t.string :url
      t.string :title
      t.string :excerpt
    end
  end
end
