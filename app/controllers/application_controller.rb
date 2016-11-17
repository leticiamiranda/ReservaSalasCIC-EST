class ApplicationController < ActionController::Base
  check_authorization
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => 'Você não tem permissão para acessar essa página.'
  end
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

end
