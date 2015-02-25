class Project < ActiveRecord::Base
  has_many :snippets
end