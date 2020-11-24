class ApplicationController < ActionController::Base
  before_action :get_users
  def get_users
    @users =  User.all
  end
end
