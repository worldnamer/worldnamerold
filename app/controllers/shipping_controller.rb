require 'csv'

class ShippingController < ApplicationController
  def export
    @files = { 
      projects: create_projects, 
      todos: create_todos, 
      snippets: create_snippets,
      goals: create_goals,
      links: create_links
    }

    export = Tempfile.new('export')
    Zip::File.open(export.path, Zip::File::CREATE) do |zipfile|
      @files.each do |filename, tempfile|
        zipfile.add("#{filename}.csv", tempfile.path)
      end
    end

    send_file export.path, filename: 'export.zip', type: 'application/octet-stream'
  end

  private

  def create_csv
    tempfile = Tempfile.new('export')

    CSV.open(tempfile.path, 'wb') do |csv|
      yield(csv)
    end

    tempfile
  end

  def create_projects
    @project_ids = []
    create_csv do |csv|
      csv << ['Id', 'Name', 'Description']
      current_user.projects.each do |project|
        csv << [project.id, project.name, project.description]
        @project_ids << project.id
      end
    end
  end

  def create_todos
    create_csv do |csv|
      csv << ['Project_Id', 'Description', 'Completed']
      Todo.where(project_id: @project_ids).each do |todo|
        csv << [todo.project_id, todo.description, todo.completed]
      end
    end
  end

  def create_snippets
    create_csv do |csv|
      csv << ['Project_Id', 'Title', 'Excerpt', 'Url']
      Snippet.where(project_id: @project_ids).each do |snippet|
        csv << [snippet.project_id, snippet.title, snippet.excerpt, snippet.url]
      end
    end
  end

  def create_goals
    create_csv do |csv|
      csv << ['Description', 'Life_Area', 'Term', 'Created_At', 'Updated_At', 'Completed']
      current_user.goals.each do |goal|
        csv << [goal.description, goal.life_area.name, goal.term.name, goal.created_at, goal.updated_at, goal.completed]
      end
    end
  end

  def create_links
    create_csv do |csv|
      csv << ['Title', 'Excerpt', 'Url', 'Created_At', 'Updated_At']
      current_user.links.each do |link|
        csv << [link.title, link.excerpt, link.url, link.created_at, link.updated_at]
      end
    end
  end
end