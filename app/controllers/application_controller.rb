# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_raven_context
  before_action :set_locale

  def authorizes! ability, collection
    collection&.map do |object|
      authorize! ability, object
    end
  end

  def current_ability
    @current_ability ||= Ability.new(current_user || User.new)
  end

  rescue_from CanCan::AccessDenied do |exception|
    render_r404 :access_denied, 403, exception
  end
  rescue_from ActiveRecord::RecordNotFound, AbstractController::ActionNotFound, ActionController::RoutingError do |exception|
    render_r404 :not_found, 404, exception
  end

  protected

  def after_sign_in_path_for resource
    games_url
  end

  private

  def set_raven_context
    Raven.user_context(id: session[:current_user_id]) # or anything else in session
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end

  def set_locale
    I18n.locale = params[:locale] || user_pref_locale || session[:locale] || user_location_detected_locale || I18n.default_locale

    session[:locale] = I18n.locale
    if current_user && I18n.locale != current_user.locale
      current_user.locale = I18n.locale
      current_user.save!
    end
  end

  def user_pref_locale
    return nil unless current_user && current_user.locale
    current_user.locale
  end
  def user_location_detected_locale
    language = browser.accept_language.first
    return nil unless language
    locale = language.code.to_sym
    return nil if locale != 'en' && locale != 'de'
    locale
  end

  def render_r404_access_denied format, status, exception
    format.html { redirect_back fallback_location: root_url, alert: I18n.t('unauthorized') }
  end
end
