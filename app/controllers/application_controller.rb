class ApplicationController < ActionController::Base
  before_action :get_users
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def get_users
    @users =  User.all
  end

  protected

  def configure_permitted_parameters
    added_attrs = [ :email, :nickname, :password, :password_confirmation ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end

end
