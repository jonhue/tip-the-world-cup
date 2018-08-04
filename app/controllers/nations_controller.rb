# frozen_string_literal: true

class NationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_game
  before_action :set_nation

  layout 'back'

  def show
    authorize! :read, @nation
    @matches = @nation.matches.order(:begins_at)
    authorizes! :read, @matches
    turbolinks_animate 'fadeinright'
  end

  private

  def set_game
    @game = Game.find(params[:game_id])
    authorize! :read, @game
  end

  def set_nation
    @nation = Nation.friendly.find(params[:id])
  end
end
