class Goal < ActiveRecord::Base
  belongs_to :user
  acts_as_list scope: :user

  belongs_to :life_area
  belongs_to :term

  validates :life_area, presence: true
  validates :term, presence: true
end