class ApplicationController < ActionController::Base
	before_action :authenticate_user!

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :firstname << :lastname
    devise_parameter_sanitizer.for(:account_update) << :firstname << :lastname
  end
end
