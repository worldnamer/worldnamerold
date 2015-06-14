class Project < ActiveRecord::Base
  has_many :sections, dependent: :destroy

  belongs_to :user
end