class WelcomeController < ApplicationController
  # GET /
  def index
    turbolinks_animate 'fadein'
  end
end
