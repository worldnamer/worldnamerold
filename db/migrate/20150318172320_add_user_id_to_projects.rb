class AddUserIdToProjects < ActiveRecord::Migration
  def change
    add_reference :projects, :user, index: true
  end
end
