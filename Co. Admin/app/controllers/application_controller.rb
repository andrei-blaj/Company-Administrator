class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :first_name, :last_name, :company_name, :ceo_email, :manager_email, :register_as, :account_type, :paid, :num_of_managers, :num_of_employees, :num_of_allowed_managers, :num_of_allowed_employees])
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to pages_home_path, :alert => exception.message
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
  	redirect_to pages_home_path, :alert => exception.message
  end

  rescue_from NoMethodError do |exception|
    redirect_to pages_home_path :alert => exception.message
  end
  
end
