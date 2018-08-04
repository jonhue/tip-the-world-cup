# frozen_string_literal: true

class ParticipantsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_game
  before_action :set_participant, only: [:show]
  before_action :set_new_participant, only: [:new]

  layout 'app'

  def index
    @participants = Participant.all
    turbolinks_animate 'fadein'
  end

  def show
    authorize! :read, @participant
    @tips = @participant.tips.unchangeable.order('matches.begins_at ASC')
    authorizes! :read, @tips
    turbolinks_animate 'fadeinright'
    render layout: 'back'
  end

  def new
    authorize! :read, @game unless @participant.present?
    @nations = Nation.all.order(:name)
    authorizes! :read, @nations
    turbolinks_animate 'fadein'
    render layout: 'application'
  end

  def create
    @participant = Participant.new(participant_params)

    if @participant.save
      redirect_to @game, notice: I18n.t('participants.create.success')
    else
      redirect_to new_game_participant_url(game_id: @game.to_param),
                  alert: I18n.t('participants.create.error')
    end
  end

  private

  def set_game
    @game = Game.find(params[:game_id])
  end

  def set_participant
    @participant = Participant.find(params[:id])
  end

  def set_new_participant
    if params.key?(:token)
      @invitation = Invitation.find_by(token: params[:token])
      @participant = @invitation&.accept
    else
      authorize! :update, Game
      @participant = @game.participants.build(user: current_user)
    end
  end

  def participant_params
    params.require(:participant).permit(:game_id, :user_id, :nation_id)
          .merge(nation_id: Nation.find_by(name: params[:commit])&.id)
  end
end
