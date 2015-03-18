class Project < ActiveRecord::Base
  has_many :snippets

  belongs_to :user
end