class Project < ActiveRecord::Base
  has_many :snippets
  has_many :sections

  belongs_to :user
end