class ApplicationController < ActionController::Base
  before_action :set_raven_context
  before_action :configure_permitted_parameters, if: :devise_controller?

  def authorizes! ability, collection
    collection&.map do |object|
      authorize! ability, object
    end
  end

  def configure_permitted_parameters
    attributes = [:email, :name, :password, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: attributes
    devise_parameter_sanitizer.permit :account_update, keys: attributes
  end

  rescue_from CanCan::AccessDenied do |exception|
    render_r404 :access_denied, 403, exception
  end
  rescue_from ActiveRecord::RecordNotFound, AbstractController::ActionNotFound, ActionController::RoutingError do |exception|
    render_r404 :not_found, 404, exception
  end

  private

  def set_raven_context
    Raven.user_context(id: session[:current_user_id]) # or anything else in session
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end

  def render_r404_access_denied format, status, exception
    format.html { redirect_back fallback_location: root_url, alert: 'You are unauthorized to perform this action' }
  end
end
