class WelcomeController < ApplicationController
  def index
    render layout: 'splash'
  end

  def main
    render layout: 'application'
  end
end
