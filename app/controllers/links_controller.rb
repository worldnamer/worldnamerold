class LinksController < ApplicationController
  respond_to :html
  
  def new
    @link = Link.new
  end

  def create
    @link = current_user.links.create(params.require(:link).permit([:title, :excerpt, :url]))

    respond_with @link, location: media_path
  end
end