class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_constants, 'set_shopping_cart_session'

  def set_constants
    @teams = Team.sorted
    @manufacturers = Manufacturer.sorted
    @products = Product.sorted
    @tags = Tag.sorted
    @grades = (1..10).to_a
    @years = (1900..Time.now.year).to_a
    @year_min = 1900
    @year_max = Time.now.year
  end

  def set_shopping_cart_session
    session[:shopping_cart_id] ||= ShoppingCart.create.id
    @shopping_cart = ShoppingCart.find session[:shopping_cart_id]
  end


  def admin?
    return cookies[:password] == 'password'
  end

  def namespace
    return ''
  end

  helper_method :admin?
  helper_method :namespace

end
