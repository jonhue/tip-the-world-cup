class InvitationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_game
  before_action :set_invitation, only: [:show]

  layout 'back'

  # GET /app/games/1/invitations/1
  def show
    authorize! :update, @invitation
    turbolinks_animate 'fadein'
  end

  # GET /app/games/1/invitations/new
  def new
    authorize! :update, @game
    @invitation = @game.invitations.build
    turbolinks_animate 'fadeinright'
  end

  # POST /app/games/1/invitations
  def create
    @invitation = @game.invitations.build invitation_params

    if @invitation.save
      redirect_to @invitation, notice: 'Invitation was successfully created.'
    else
      redirect_to @game, alert: 'Could not send invitation.'
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
