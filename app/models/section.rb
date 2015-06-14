class Section < ActiveRecord::Base
  belongs_to :project

  has_many :todos, dependent: :destroy
  has_many :snippets, dependent: :destroy
end