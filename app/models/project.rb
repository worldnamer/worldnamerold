class Project < ActiveRecord::Base
  has_many :snippets
  has_many :todos

  belongs_to :user
end