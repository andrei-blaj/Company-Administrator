class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  skip_before_action :verify_authenticity_token, if: :json_request?

  def current_mobile_user
    User.find_by(auth_token: params[:auth_token])
  end

  def json_request?
    request.format.json?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :first_name, :last_name, :company_name, :ceo_email, :manager_email, :register_as, :paid, :num_of_managers, :num_of_employees, :company_plan_id, :auth_token])
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

  protected
  def auth_only!
    render json: "You are not logged in!", status: 401 unless current_mobile_user
  end

end
