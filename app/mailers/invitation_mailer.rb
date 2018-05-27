class InvitationMailer < ApplicationMailer
  def invitation sender, invitation
    @user = User.find_by(email: invitation.email)
    @invitation = invitation
    mail(to: invitation.email, subject: "#{sender.name} invited you to tip the 2018 World Cup")
  end
end
