class ApplicationController < ActionController::Base
  # atehenticate
  before_action :authenticate_user!
  # para agregar parametros al new_loggin
  before_action :configure_permitted_parameters, if: :devise_controller?
  # pandit
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
  def pundit_user
    current_user
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :name, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :name, :avatar])
  end

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_back(fallback_location: root_path)
  end

end
