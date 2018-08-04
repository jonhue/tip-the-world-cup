# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]
    before_action :configure_account_update_params, only: [:update]

    layout 'back', only: [:edit]

    def new
      turbolinks_animate 'fadein'
      super
    end

    # rubocop:disable Metrics/AbcSize, Metrics/BlockNesting,
    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/MethodLength,
    # rubocop:disable Metrics/PerceivedComplexity
    def create
      build_resource sign_up_params

      resource.save
      yield resource if block_given?
      if resource.persisted?
        if resource.active_for_authentication?
          set_flash_message! :notice, :signed_up
          sign_up resource_name, resource
          if invitation_param && invitation_param != ''
            invitation = Invitation.find_by(token: invitation_param)
            invitation.update! user: current_user
          end
          if participate_param && participate_param != ''
            game = Game.find_by(id: participate_param)
            Invitation.create! user: current_user, game: game if game
          end
          respond_with resource, location: after_sign_up_path_for(resource)
        else
          set_flash_message! :notice,
                             :"signed_up_but_#{resource.inactive_message}"
          expire_data_after_sign_in!
          respond_with resource,
                       location: after_inactive_sign_up_path_for(resource)
        end
      else
        clean_up_passwords resource
        set_minimum_password_length
        respond_with resource
      end
    end
    # rubocop:enable Metrics/AbcSize, Metrics/BlockNesting,
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/MethodLength,
    # rubocop:enable Metrics/PerceivedComplexity

    def edit
      turbolinks_animate 'fadeinright'
      super
    end

    # def update
    #   super
    # end

    # def destroy
    #   super
    # end

    # Forces the session data which is usually expired after sign
    # in to be expired now. This is useful if the user wants to
    # cancel oauth signing in/up in the middle of the process,
    # removing all OAuth session data.
    # def cancel
    #   super
    # end

    protected

    def invitation_param
      sign_up_params = devise_parameter_sanitizer.sanitize :sign_up
      sign_up_params[:token]
    end

    def participate_param
      sign_up_params = devise_parameter_sanitizer.sanitize :sign_up
      sign_up_params[:game_id]
    end

    def sign_up_params
      sign_up_params = devise_parameter_sanitizer.sanitize :sign_up
      sign_up_params.delete :token
      sign_up_params.delete :game_id
      sign_up_params
    end

    # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up,
                                        keys: [:name, :token, :game_id])
    end

    # If you have extra params to permit, append them to the sanitizer.
    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end

    # The path used after sign up.
    def after_sign_up_path_for(resource)
      if resource.invitations.any?
        new_game_participant_url(
          game_id: resource.invitations.last.game.to_param
        )
      else
        games_url
      end
    end

    # The path used after sign up for inactive accounts.
    # def after_inactive_sign_up_path_for(resource)
    #   super(resource)
    # end
  end
end
