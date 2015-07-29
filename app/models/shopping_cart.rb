class ShoppingCart < ActiveRecord::Base
  has_many :line_items

  def total_price
    price = Money.new(0, 'USD')
    self.line_items.each do |li|
      price = price + li.item.price * li.quantity
    end
    price
  end
end
