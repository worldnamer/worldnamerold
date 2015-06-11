class MediaController < ApplicationController
  def index
    @links = current_user.links
  end
end