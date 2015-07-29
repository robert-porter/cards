module PayPal
  @checkout_url = "https://www.sandbox.paypal.com/cgi-bin/webscr?"
  @business_email = 'robert.j.porter10-facilitator@gmail.com'

  def self.buy_now_query(item, quantity)
    values = self.app_values
    values.merge!(self.get_buy_now_values(item, quantity))
    @checkout_url + values.to_query
  end

  def self.buy_cart_query(shopping_cart)
    values = self.app_values
    values.merge!(self.get_cart_values shopping_cart)
    @checkout_url + values.to_query
  end

  def self.create_order_from_ipn(params)
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
    end

    order
  end


    def self.app_values
      app_host =' https://0b8afbf7.ngrok.io'
      {
          business: @business_email,
          upload: 1,
          return: app_host,
          notify_url: "#{app_host}/pay_pal_hook",
          cmd: '_cart'
      }
    end

  def self.get_cart_values(shopping_cart)
    values = {}
    shopping_cart.line_items.each_with_index do |line_item, index|
      values.merge!({
                        "amount_#{index + 1}" => line_item.item.price,
                        "item_name_#{index + 1}" => line_item.item.annotated_name,
                        "item_number_#{index + 1}" => line_item.item.id,
                        "quantity_#{index + 1}" => line_item.quantity
                    })
    end
    values.merge({shipping_1: ShippingPriceCalculator.calculate_shopping_cart_shipping_price(shopping_cart)})
  end

  def self.get_buy_now_values(item, quantity)
    {
        amount_1: item.price,
        item_name_1: item.annotated_name,
        item_number_1: item.id,
        quantity_1: quantity,
        shipping_1: ShippingPriceCalculator.calculate_buy_now_shipping_price(item, quantity)
    }
  end
end