class NationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_game
  before_action :set_nation

  # GET /games/1/nations/1
  def show
  end

  private

  def set_game
    @game = Game.find(params[:game_id])
  end

  def set_nation
    @nation = Nation.find(params[:id])
  end
end
