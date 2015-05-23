class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :check_admin

  def is_admin
    return @is_admin
  end

  def check_admin
    @is_admin = cookies[:password] == 'password'
  end
end
