
class OrdersController < ApplicationController
  protect_from_forgery except: [:pay_pal_hook]
  def pay_pal_hook
    params.permit! # Permit all Paypal input params
    status = params[:payment_status]
    if status == 'Completed'

      order = Order.new
      address = Address.create_from_pay_pal_notification_params params


      order.update_attributes notification_params: params,
                               status: status,
                               transaction_id: params[:txn_id],
                               purchased_at: Time.now,
                               first_name: params[:first_name],
                               last_name: params[:last_name],
                               email: params[:payer_email],
                               address_id: address.id


      if params[:txn_type] == 'cart'
        num_items = params[:num_cart_items].to_i
        1.upto num_items do |i|
          line_item = OrderLineItem.new
          line_item.item_id = params["item_number#{i}"]
          line_item.quantity = params["quantity#{i}"]
          line_item.order_id = order.id
          line_item.save
          line_item.item.quantity = line_item.item.quantity - line_item.quantity
          line_item.item.save
        end
      else
        line_item = OrderLineItem.new
        line_item.item_id = params[:item_number]
        line_item.quantity = params[:quantity]
        line_item.order_id = order.id
        line_item.save
        line_item.item.quantity = line_item.item.quantity - line_item.quantity
        line_item.item.save
      end

    end

    render nothing: true
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find params[:id]
  end


  def get_shipping_price shopping_cart
    card_shipping = 0
    shipping = 0

    shopping_cart.line_items.each do |line_item|
      item = line_item.item
      if item.product.name == 'Single'
        card_shipping = 2.00
      else
        shipping = shipping + (item.shipping_price_cents / 100.00) * line_item.quantity
      end
    end

    shipping + card_shipping
  end

  def checkout
    @order = Order.new

    app_host =' https://0b8afbf7.ngrok.io'

    values = {
        business: 'robert.j.porter10-facilitator@gmail.com',
        cmd: '_cart',
        upload: 1,
        return: "#{app_host}#{items_path @item}",
        notify_url: "#{app_host}/pay_pal_hook"
    }



    @shopping_cart = ShoppingCart.find session[:shopping_cart_id]


    @shopping_cart.line_items.each_with_index do |line_item, index|
      @item = Item.find(line_item.item_id)
      if @item.quantity < line_item.quantity
        redirect_to :back
        return
      end

      values.merge!({
        "amount_#{index + 1}" => line_item.item.price_cents / 100,
        "item_name_#{index + 1}" => line_item.item.annotated_name,
        "item_number_#{index + 1}" => line_item.item.id,
        "quantity_#{index + 1}" => line_item.quantity
      })
    end

    values.merge!({shipping_1: get_shipping_price(@shopping_cart)})

    redirect_to "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end

  def buy

    @item = Item.find(params[:id])
    @order = Order.new

    order_quantity = params[:quantity].to_i

    if @item.quantity < order_quantity
      redirect_to item_path @item
      return
    end

    shipping = 0
    if @item.product.name == 'Single' #TODO this is probably a bad way to check this...
      shipping = 2
      pp shipping
    else
      pp @item.product.name
      shipping = (@item.shipping_price_cents / 100) * params[:quantity].to_i
    end


    app_host ='http://d940764c.ngrok.io'

    values = {
        business: 'robert.j.porter10-facilitator@gmail.com',
        cmd: '_xclick',
        upload: 1,
        return: "#{app_host}#{items_path @item}",
        amount: @item.price_cents / 100,
        item_name: @item.annotated_name,
        item_number: @item.id,
        quantity: params[:quantity],
        shipping: shipping,
        notify_url: "#{app_host}/pay_pal_hook"
    }
    redirect_to "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end

end