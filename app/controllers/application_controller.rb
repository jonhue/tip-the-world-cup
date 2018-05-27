class ApplicationController < ActionController::Base
  before_action :set_raven_context

  def authorizes! ability, collection
    collection&.map do |object|
      authorize! ability, object
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    render_r404 :access_denied, 403, exception
  end
  rescue_from ActiveRecord::RecordNotFound, AbstractController::ActionNotFound, ActionController::RoutingError do |exception|
    render_r404 :not_found, 404, exception
  end

  protected

  def after_sign_in_path_for(resource)
    games_url
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
