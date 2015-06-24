class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :check_admin
  before_filter :set_constants

  def set_constants
    @teams = Team.sorted
    @manufacturers = Manufacturer.sorted
    @products = Product.sorted
    @tags = Tag.sorted
    @grades = (1..10).to_a
    @years = (1900..Time.now.year).to_a;
  end

  def is_admin
    return @is_admin
  end

  def check_admin
    @is_admin = cookies[:password] == 'password'
  end


end
