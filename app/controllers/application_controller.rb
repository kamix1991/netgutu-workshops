class ApplicationController < ActionController::Base
  
  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  rescue_from CanCan::AccessDenied do |exception|
    if user_signed_in?
      redirect_to root_path, alert: exception.message
    else
      redirect_to new_user_session_path, :notice => flash[:alert] || "You must login first"
    end
  end

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :firstname << :lastname
    devise_parameter_sanitizer.for(:account_update) << :firstname << :lastname
  end
end
