class ShoppingCartsController < ApplicationController

  def add_line_item
    @shopping_cart = ShoppingCart.find session[:shopping_cart_id]
    @line_item = @shopping_cart.line_items.where(:item_id => params[:item_id]).first
    @quantity_added = false
    @error = false

    if @line_item == nil
      @line_item = LineItem.new
      @line_item.quantity = params[:quantity].to_i
      @line_item.item_id = params[:item_id].to_i
      @line_item.shopping_cart = @shopping_cart
    else
      @line_item.quantity = @line_item.quantity + params[:quantity].to_i
      @quantity_added = true
    end

    if @line_item.item.quantity < @line_item.quantity
      @error = true
    else
      @line_item.save
    end
    respond_to do |format|
      format.js   {}
    end
  end

  def destroy_line_item
    line_item = LineItem.find_by_id(params[:id])

    if line_item
      line_item.destroy
    end

    respond_to do |format|
      format.js   { render :layout => false }
    end
  end

  def destroy_all_line_items
    @shopping_cart = ShoppingCart.find session[:shopping_cart_id]
    @shopping_cart.line_items.destroy_all

    respond_to do |format|
      format.js   { render :layout => false }
    end
  end

  def index
    @shopping_cart = ShoppingCart.find session[:shopping_cart_id]
  end
end
