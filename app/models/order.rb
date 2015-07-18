class Order < ActiveRecord::Base
  belongs_to :address
  has_many :order_line_items



  def total_price_cents
    cents = 0
    self.order_line_items.each do |li|
      cents = cents + li.item.price_cents * li.quantity
      pp li.item.price_cents
      pp li.item.quantity
      pp cents
    end
    cents
  end


  def next
    Order.where('id > ?', self.id).order(id: :asc).first
  end

  def prev
    Order.where('id < ?', self.id).order(id: :desc).first
  end
end
