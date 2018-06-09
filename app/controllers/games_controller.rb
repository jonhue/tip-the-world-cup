class GamesController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_game, only: [:show, :update, :destroy]

  layout 'app'

  # GET /app
  def index
    @games = current_user.games.includes(:participants).sort_by { |game| game.participants.find_by(user_id: current_user.id).days_left_before_next_required_tip }
    @invitations = current_user.invitations.unaccepted
    authorizes! :read, @games
    authorizes! :update, @invitations
    turbolinks_animate 'fadein'
    render layout: 'application'
  end

  # GET /app/1
  def show
    authorize! :read, @game
    if current_user
      @participants = @game.participants.leaderboard.take(3)
      authorizes! :read, @participants
      @matches = Match.future.limit(3).order(:begins_at)
      authorizes! :read, @matches
      turbolinks_animate 'fadein'
    else
      redirect_to new_user_registration_url(game_id: @game.to_param)
    end
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
      redirect_to new_game_participant_url(game_id: @game.to_param), notice: I18n.t('games.create.success')
    else
      redirect_to new_game_url, alert: I18n.t('games.create.error')
    end
  end

  # PATCH/PUT /app/1
  def update
    authorize! :update, @game

    if @game.update game_params
      redirect_to @game, notice: I18n.t('games.update.success')
    else
      redirect_to @game, alert: I18n.t('games.update.error')
    end
  end

  # DELETE /app/1
  def destroy
    authorize! :destroy, @game
    @game.destroy
    redirect_to games_url, notice: I18n.t('games.destroy.success')
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:name, :bet, :rule_match, :rule_goal_difference, :rule_tendency, :rule_miss, :private)
  end
end
