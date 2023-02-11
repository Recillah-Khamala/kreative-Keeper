class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  # before_action :authenticate_user!
  # before_action :update_allowed_parameters, if: :devise_controller?

  # def after_sign_in_path_for(_resource)
  #   users_url
  # end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :bio, :photo, :email, :password, :password_confirmation, :role)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :bio, :photo, :email, :password, :current_password, :role)
    end
  end
end
