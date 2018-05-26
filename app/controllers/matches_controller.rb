class MatchesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_game
  before_action :set_match, only: [:show]

  layout :app

  # GET /app/games/1/matches
  def index
    @matches = @game.matches
    authorizes! :read, @matches
    turbolinks_animate 'fadein'
  end

  # GET /app/games/1/matches/1
  def show
    authorize! :read, @match
    turbolinks_animate 'fadeinright'
    render layout: 'back'
  end

  private

  def set_game
    @game = Game.find(params[:game_id])
    authorize! :read, @game
  end

  def set_match
    @match = Match.find(params[:id])
  end
end
