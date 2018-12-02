class ApplicationController < ActionController::Base
  before_action :update_sanitized_params, if: :devise_controller?
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied! Please contact Admin."
    redirect_to root_path
  end

  def update_sanitized_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:fullname, :contactno, :email, :password, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar])
  end

end
