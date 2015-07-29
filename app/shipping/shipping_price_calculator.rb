module ShippingPriceCalculator

  @single_shipping_price = Money.new(200, 'USD')

  def self.calculate_shopping_cart_shipping_price(shopping_cart)
    card_shipping = Money.new(0, 'USD');
    shipping = Money.new(0, 'USD')

    shopping_cart.line_items.each do |line_item|
      item = line_item.item
      if item.product.name == 'Single'
        card_shipping = @single_shipping_price
      else
        shipping = shipping + item.shipping_price * line_item.quantity
      end
    end
    shipping + card_shipping
  end


  def self.calculate_buy_now_shipping_price(item, quantity)
    if item.product.name == 'Single' #TODO this is probably a bad way to check this...
      @single_shipping_price
    else
      item.shipping_price * quantity
    end
  end
end