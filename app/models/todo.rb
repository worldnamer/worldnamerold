class Todo < ActiveRecord::Base
  belongs_to :section
  
  def complete!
    self.completed = true
    self.save
  end

  def uncomplete!
    self.completed = false
    self.save
  end
end