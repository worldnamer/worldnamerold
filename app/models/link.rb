class Link < ActiveRecord::Base
  belongs_to :user

  belongs_to :linkable, polymorphic: true
end