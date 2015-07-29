class Order < ActiveRecord::Base
  belongs_to :address
  has_many :order_line_items

  attr_accessor :card_number, :card_verification
  attr_accessor :card_expires_on

  def total_price
    price = Money.new(0, 'USD')
    self.order_line_items.each do |li|
      price = price + li.item.price * li.quantity
    end
    price
  end


  def next
    Order.where('id > ? and processed = false', self.id).order(id: :asc).first
  end

  def prev
    Order.where('id < ? and processed = false', self.id).order(id: :desc).first
  end
end
