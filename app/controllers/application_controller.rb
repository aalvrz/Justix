class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :find_bufete, if: :user_signed_in?
  
  # If CanCan privileges are denied
  rescue_from CanCan::AccessDenied do |e|
    flash[:danger] = "Acceso denegado. Usted no tiene permiso para realizar esta accion"
    redirect_to root_path
  end
  
  def after_sign_in_path_for(resource)
    current_user.bufetes.first
  end
  
  private
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :nombre, :apellido, :plan, :password_confirmation, :remember_me) }
      devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password, :remember_me) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:nombre, :apellido, :email, :password, :password_confirmation, :current_password ) }
      
    end
  
    def find_bufete
      @bufete = current_user.bufetes.first
    end
end
