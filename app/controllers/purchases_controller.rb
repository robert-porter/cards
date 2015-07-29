require "active_merchant/billing/rails"


class PurchasesController < ApplicationController

  def check_cart_items_out_of_stock(shopping_cart)
    shopping_cart.line_items.any? do |line_item|
      line_item.quantity > line_item.item.quantity
    end
  end

  def check_buy_now_item_out_of_stock(item, quantity)
    quantity > item.quantity
  end


  def checkout_pay_pal
    if check_cart_items_out_of_stock(shopping_cart)
      redirect :back
      return
    end

    url = PayPal.buy_cart_query(shopping_cart)

    shopping_cart.destroy

    redirect_to url
  end

  def buy_now_pay_pal
    item = Item.find(params[:item_id])
    quantity = params[:quantity].to_i

    if check_buy_now_item_out_of_stock(item, quantity)
      redirect_to item_path item
      return
    end

    url = PayPal.buy_now_query(item, quantity)

    redirect_to url
  end

  def checkout
    @purchase = Purchase.new

  end

  def buy_now
    item = Item.find(params[:item_id])
    quantity = params[:quantity].to_i

    if check_buy_now_item_out_of_stock(item, quantity)
      redirect_to item_path item
      return
    end
    @shopping_cart.line_items.destroy_all
    line_item = LineItem.new item: item, quantity:quantity, shopping_cart: @shopping_cart
    line_item.save

    redirect_to '/purchases/checkout'
  end

  def create
    @purchase = Purchase.new purchase_params
    @purchase.ip_address = request.remote_ip

    if pay(shopping_cart, @purchase)
      render '/'
    end
  end


  def purchase_options(purchase)
    {
        :ip => purchase.ip_address,
        :billing_address => {
            :name     => purchase.billing_address_name,
            :address1 => purchase.billing_address_address1,
            :address2 => purchase.billing_address_address2,
            :city     => purchase.billing_address_city,
            :state    => purchase.billing_address_state,
            :country  => 'US',
            :zip      => purchase.billing_address_zip
        }
    }
  end



  def pay shopping_cart, purchase
    error = false


    unless purchase.address.valid?
      pp purchase.address.errors
      purchase.address.errors.each do |error|
        flash_message :error, error
      end
      flash_message :error, 'Address not valid'
      error = true
    end

    unless purchase.credit_card.valid?
      purchase.credit_card.errors.full_messages.each do |message|
        flash_message :error, message
      end
      error = true
    end

    if error
      redirect_to :back
      return
    end
    response = GATEWAY.purchase(shopping_cart.total_price, purchase.credit_card, purchase_options(purchase))
    unless response.success?
      flash_message :error, response.message
      redirect_to :back
      return
    end
    pp response
    response.success?
  end

  def purchase_params
    params.require(:purchase).permit(
      :contact_phone, :contact_email,
      :shipping_address_name, :shipping_address_address1, :shipping_address_address2,
      :shipping_address_city, :shipping_address_state, :shipping_address_zip,
      :card_first_name, :card_last_name, :card_type, :card_number, :card_verification, :card_expiration_month,
      :card_expiration_year,
      :billing_address_name, :billing_address_address1, :billing_address_address2,
      :billing_address_city, :billing_address_state, :billing_address_zip)
  end
end