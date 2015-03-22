class Todo < ActiveRecord::Base
  def complete!
    self.completed = true
    self.save
  end

  def uncomplete!
    self.completed = false
    self.save
  end
end