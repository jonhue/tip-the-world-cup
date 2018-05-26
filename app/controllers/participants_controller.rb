class ParticipantsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_game
  before_action :set_participant, only: [:show, :destroy]

  # GET /app/games/1/participants
  def index
    @participants = Participant.all
  end

  # GET /app/games/1/participants/1
  def show
  end

  # GET /app/games/1/participants/new
  def new
    @participant = Participant.new
  end

  # POST /app/games/1/participants
  def create
    @participant = Participant.new(participant_params)

    respond_to do |format|
      if @participant.save
        format.html { redirect_to @participant, notice: 'Participant was successfully created.' }
        format.json { render :show, status: :created, location: @participant }
      else
        format.html { render :new }
        format.json { render json: @participant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1/participants/1
  def destroy
    @participant.destroy
    respond_to do |format|
      format.html { redirect_to participants_url, notice: 'Participant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_game
    @game = Game.find(params[:game_id])
  end

  def set_participant
    @participant = Participant.find(params[:id])
  end

  def participant_params
    params.require(:participant).permit(:bet, :rule_match, :rule_goal_difference, :rule_tendency, :rule_miss, :private)
  end
end
