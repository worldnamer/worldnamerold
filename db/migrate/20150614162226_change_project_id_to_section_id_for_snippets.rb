class ChangeProjectIdToSectionIdForSnippets < ActiveRecord::Migration
  def change
    add_column :snippets, :section_id, :integer

    project_ids = Snippet.select(:project_id).distinct.pluck(:project_id)

    project_ids.each do |project_id|
      section = Project.find(project_id).sections.create(name: 'Links', section_type: 'links')
      section.snippets = Snippet.where(project_id: project_id)
      section.save
    end

    remove_column :snippets, :project_id
  end
end
