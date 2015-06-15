class MediaController < ApplicationController
  def index
    @links = current_user.links.where(linkable: nil)
  end
end