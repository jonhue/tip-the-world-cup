class ParticipantsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_game
  before_action :set_participant, only: [:show, :destroy]

  layout :back

  # GET /app/games/1/participants
  def index
    @participants = Participant.all
  end

  # GET /app/games/1/participants/1
  def show
  end

  # GET /app/games/1/participants/new
  def new
    if params.has_key?(:invitation_id)
      @invitation = Invitation.find(params[:invitation_id])
      authorize! :update, Invitation
      @participant = @invitation.accept
    else
      authorize! :update, Game
      @participant = @game.participants.build(user: current_user)
    end
    render layout: 'mozaic'
  end

  # POST /app/games/1/participants
  def create
    @participant = Participant.new participant_params

    if @participant.save
      redirect_to @game, notice: 'Participant was successfully created.']
    else
      redirect_to @part
    end
  end

  # DELETE /games/1/participants/1
  def destroy
    authorize! :destroy, @participant
    @participant.destroy
    redirect_to games_url, notice: 'Participant was successfully destroyed.'
  end

  private

  def set_game
    @game = Game.find(params[:game_id])
  end

  def set_participant
    @participant = Participant.find(params[:id])
  end

  def participant_params
    params.require(:participant).permit(:game_id, :user_id, :nation_id)
  end
end
