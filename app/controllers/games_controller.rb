class GamesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_game, only: [:show, :update, :destroy]

  # GET /app/games
  def index
    @games = Game.all
  end

  # GET /app/games/1
  def show
  end

  # GET /app/games/new
  def new
    @game = Game.new
  end

  # POST /app/games
  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /app/games/1
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /app/games/1
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:bet, :rule_match, :rule_goal_difference, :rule_tendency, :rule_miss, :private)
  end
end
