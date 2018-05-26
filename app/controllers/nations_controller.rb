class NationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_game
  before_action :set_nation

  layout :back

  # GET /app/games/1/nations/1
  def show
    authorize! :read, @nation
    @matches = @nation.matches.includes(tips: { participant: { game: @game } })
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
