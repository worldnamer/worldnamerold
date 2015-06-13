class Project < ActiveRecord::Base
  has_many :snippets
  has_many :todos, -> {order(completed: :desc)}
  has_many :sections

  belongs_to :user
end