class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locate

  def set_locate
    I18n.locale = params[:lang] || I18n.default_locale
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :username])
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => "No tiene permiso para acceder a esta página."
  end
end
