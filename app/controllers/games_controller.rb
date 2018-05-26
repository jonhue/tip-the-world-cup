class GamesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_game, only: [:show, :update, :destroy]

  layout :app

  # GET /app/games
  def index
    @games = current_user.games
    @invitations = current_user.invitations
    authorizes! :read, @games
    authorizes! :update, @invitations
  end

  # GET /app/games/1
  def show
    authorize! :read, @game
  end

  # GET /app/games/new
  def new
    @game = current_user.administrated_games.build
    authorize! :create, @game
    render layout: 'back'
  end

  # POST /app/games
  def create
    @game = current_user.administrated_games.build game_params
    authorize! :create, @game

    if @game.save
      redirect_to @game, notice: 'Game was successfully created.'
    else
      redirect_to new_game_url, alert: 'Could not create game.'
    end
  end

  # PATCH/PUT /app/games/1
  def update
    authorize! :update, @game

    if @game.update game_params
      redirect_to @game, notice: 'Game was successfully updated.'
    else
      redirect_to @game, alert: 'Could not update game.'
    end
  end

  # DELETE /app/games/1
  def destroy
    authorize! :destroy, @game
    @game.destroy
    redirect_to games_url, notice: 'Game was successfully destroyed.'
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:name, :bet, :rule_match, :rule_goal_difference, :rule_tendency, :rule_miss, :private)
  end
end
