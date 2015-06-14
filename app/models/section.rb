class Section < ActiveRecord::Base
  belongs_to :project

  has_many :todos
end