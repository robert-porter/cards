class ShoppingCart < ActiveRecord::Base
  has_many :line_items


  def get_pay_pal_values

  end

  def total_price_cents
    cents = 0
    self.line_items.each do |li|
      cents = cents + li.item.price_cents * li.quantity
      pp li.item.price_cents
      pp li.item.quantity
      pp cents
    end
    cents
  end

end
