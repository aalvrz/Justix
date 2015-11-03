class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # If CanCan privileges are denied
  rescue_from CanCan::AccessDenied do |e|
    flash[:danger] = "Acceso denegado. Usted no tiene permiso para realizar esta accion"
    redirect_to root_path
  end
  
  
  private
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :remember_me) }
      devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password, :remember_me) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :last_name, :email, :password, :password_confirmation, :current_password, :avatar ) }
      
    end
end
