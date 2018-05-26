class TipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_game
  before_action :set_participant
  before_action :set_tip, only: [:show, :update, :destroy]

  # GET /app/games/1/participants/1/tips
  def index
    @tips = Tip.all
  end

  # GET /app/games/1/participants/1/tips/1
  def show
  end

  # POST /app/games/1/participants/1/tips
  def create
    @tip = Tip.new(tip_params)

    respond_to do |format|
      if @tip.save
        format.html { redirect_to @tip, notice: 'Tip was successfully created.' }
        format.json { render :show, status: :created, location: @tip }
      else
        format.html { render :new }
        format.json { render json: @tip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /app/games/1/participants/1/tips/1
  def update
    respond_to do |format|
      if @tip.update(tip_params)
        format.html { redirect_to @tip, notice: 'Tip was successfully updated.' }
        format.json { render :show, status: :ok, location: @tip }
      else
        format.html { render :edit }
        format.json { render json: @tip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /app/games/1/participants/1/tips/1
  def destroy
    @tip.destroy
    respond_to do |format|
      format.html { redirect_to tips_url, notice: 'Tip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_game
    @game = Game.find(params[:game_id])
  end

  def set_participant
    @participant = Participant.find(params[:participant_id])
  end

  def set_tip
    @tip = Tip.find(params[:id])
  end

  def tip_params
    params.require(:tip).permit(:home_goals, :away_goals)
  end
end
