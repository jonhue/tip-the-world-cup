# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    turbolinks_animate 'fadein'
  end
end
