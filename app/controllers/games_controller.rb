class GamesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_game, only: [:show, :update, :destroy]

  layout 'app'

  # GET /app
  def index
    @games = current_user.games.includes(:participants)
    @invitations = current_user.invitations.unaccepted
    authorizes! :read, @games
    authorizes! :update, @invitations
    turbolinks_animate 'fadein'
    render layout: 'application'
  end

  # GET /app/1
  def show
    authorize! :read, @game
    @participants = @game.participants.leaderboard.take(3)
    authorizes! :read, @participants
    @matches = Match.future.limit(3).order(:begins_at)
    authorizes! :read, @matches
    turbolinks_animate 'fadein'
  end

  # GET /app/new
  def new
    @game = current_user.administrating_games.build
    authorize! :create, @game
    turbolinks_animate 'fadeinright'
    render layout: 'back'
  end

  # POST /app
  def create
    @game = current_user.administrating_games.build game_params
    authorize! :create, @game

    if @game.save
      redirect_to new_game_participant_url(game_id: @game.to_param), notice: 'Game was successfully created.'
    else
      redirect_to new_game_url, alert: 'Could not create game.'
    end
  end

  # PATCH/PUT /app/1
  def update
    authorize! :update, @game

    if @game.update game_params
      redirect_to @game, notice: 'Game was successfully updated.'
    else
      redirect_to @game, alert: 'Could not update game.'
    end
  end

  # DELETE /app/1
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
