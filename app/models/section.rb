class Section < ActiveRecord::Base
  belongs_to :project

  has_many :todos, dependent: :destroy
  has_many :links, as: :linkable, dependent: :destroy
end