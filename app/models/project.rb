class Project < ActiveRecord::Base
  has_many :snippets
  has_many :todos, -> {order(completed: :desc)}

  belongs_to :user
end