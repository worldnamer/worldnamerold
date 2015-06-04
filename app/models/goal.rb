class Goal < ActiveRecord::Base
  belongs_to :user
  acts_as_list scope: :user

  belongs_to :life_area

  validates :life_area, presence: true
end