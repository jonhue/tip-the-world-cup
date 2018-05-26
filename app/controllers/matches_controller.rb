class MatchesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_game
  before_action :set_match, only: [:show]

  # GET /app/games/1/matches
  def index
    @matches = Match.all
  end

  # GET /app/games/1/matches/1
  def show
  end

  private

  def set_game
    @game = Game.find(params[:game_id])
  end

  def set_match
    @match = Match.find(params[:id])
  end
end
