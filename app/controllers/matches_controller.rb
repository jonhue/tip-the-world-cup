class MatchesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_game
  before_action :set_match, only: [:show]

  layout :back

  # GET /app/games/1/matches
  def index
    @matches = @game.matches
    authorizes! :read, @matches
  end

  # GET /app/games/1/matches/1
  def show
    authorize! :read, @match
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
