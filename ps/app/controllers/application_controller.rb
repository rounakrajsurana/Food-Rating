class ApplicationController < ActionController::Base
  before_action :update_sanitized_params, if: :devise_controller?
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied! Please contact Admin."
    redirect_to root_path
  end

  def update_sanitized_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:fullname, :contactno, :email, :password])
  end
  # rescue_from NoMethodError do |exception|
  #   flash[:error] = "Incorrect values! Please check again."
  #   redirect_to root_path
  # end



  # helper_method :current_user
  #
  # private
  # def current_user
  #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  # end

end
