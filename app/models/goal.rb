class Goal < ActiveRecord::Base
  belongs_to :user

  belongs_to :life_area
  belongs_to :term

  validates :life_area, presence: true
  validates :term, presence: true

  def complete
    update_attributes(completed: true)
  end
end