require 'csv'

desc "Import a zip file from tmp/export.zip into the database, dropping existing projects, goals, etc. "
task import: :environment do
  begin
    user = User.first

    files = {}
    Zip::File.open('tmp/export.zip') do |zipfile|
      zipfile.each do |file|
        filepath = "tmp/#{file.name}"
        file.extract(filepath)
        key_name = file.name[0, file.name.index('.csv')]
        files[key_name.to_sym] = filepath
      end
    end

    projects = {}
    CSV.foreach(files[:projects], headers: true) do |row|
      id = row[0]
      name = row[1]
      description = row[2]
      projects[id] = Project.new(name: name, description: description, user: user)
    end

    sections = {}
    CSV.foreach(files[:sections], headers: true) do |row|
      project_id = row[0]
      id = row[1]
      name = row[2]
      section_type = row[3]
      sections[id] = projects[project_id].sections.build(name: name, section_type: section_type)
    end

    CSV.foreach(files[:todos], headers: true) do |row|
      section_id = row[0]
      description = row[1]
      completed = row[2]

      sections[section_id].todos.build(description: description, completed: completed)
    end

    CSV.foreach(files[:snippets], headers: true) do |row|
      section_id = row[0]
      title = row[1]
      excerpt = row[2]
      url = row[3]

      sections[section_id].links.build(title: title, excerpt: excerpt, url: url, user: user)
    end

    goals = []
    CSV.foreach(files[:goals], headers: true) do |row|
      description = row[0]
      life_area = LifeArea.where(name: row[1]).first
      term = Term.where(name: row[2]).first
      created_at = row[3]
      updated_at = row[4]
      completed = row[5]

      goals << Goal.new(
        description: description, 
        life_area: life_area, 
        term: term, 
        created_at: created_at, 
        updated_at: updated_at, 
        completed: completed, 
        user: user
      )
    end

    links = []
    CSV.foreach(files[:links], headers: true) do |row|
      title = row[0]
      excerpt = row[1]
      url = row[2]
      created_at = row[3]
      updated_at = row[4]

      links << Link.new(title: title, excerpt: excerpt, url: url, created_at: created_at, updated_at: updated_at, user: user)
    end

    ActiveRecord::Base.transaction do
      Project.destroy_all
      Section.destroy_all
      Todo.destroy_all
      Goal.destroy_all
      Link.destroy_all
      projects.each { |project_id, project| project.save }
      goals.each { |goal| goal.save }
      links.each { |link| link.save }
    end
  ensure
    files.each do |filename, filepath|
      File.unlink(filepath)
    end
  end
end
