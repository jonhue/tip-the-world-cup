class InvitationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_game
  before_action :set_invitation, only: [:show]

  # GET /app/games/1/invitations/1
  def show
  end

  # GET /app/games/1/invitations/new
  def new
    @invitation = Invitation.new
  end

  # POST /app/games/1/invitations
  def create
    @invitation = Invitation.new(invitation_params)

    if @invitation.save
      redirect_to @invitation, notice: 'Invitation was successfully created.'
    else
      render :new
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
    params.require(:invitation).permit(:email, :accepted)
  end
end
