# frozen_string_literal: true

class InvitationsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_game
  before_action :set_invitation, only: [:show]

  layout 'back'

  # GET /app/1/invitations/1
  def show
    unless params[:token] == @invitation.token
      redirect_to root_url, alert: I18n.t('invitations.show.token_invalid')
    end
    turbolinks_animate 'fadein'
    render layout: 'application'
  end

  # GET /app/1/invitations/new
  def new
    authorize! :update, @game
    @invitation = @game.invitations.build
    turbolinks_animate 'fadeinright'
  end

  # POST /app/1/invitations
  def create
    @invitation = @game.invitations.build invitation_params

    if @invitation.save
      redirect_to @game, notice: I18n.t('invitations.create.success')
    else
      redirect_to @game, alert: I18n.t('invitations.create.error')
    end
  end

  private

  def set_game
    @game = Game.find(params[:game_id])
  end

  def set_invitation
    @invitation = Invitation.find(params[:id])
  end

  def invitation_params
    params.require(:invitation).permit(:email, :accepted, :message)
  end
end
