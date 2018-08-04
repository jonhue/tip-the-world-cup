# frozen_string_literal: true

class MatchesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_game
  before_action :set_match, only: [:show]

  layout 'app'

  def index
    @matches = Match.all.order(:begins_at)
    authorizes! :read, @matches
    turbolinks_animate 'fadein'
  end

  def show
    authorize! :read, @match
    @tips = @match.tips.includes(:participant)
                  .where(participants: { game: @game })
                  .sort_by(&:earned_points)
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
