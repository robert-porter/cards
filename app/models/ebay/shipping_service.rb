class Ebay::ShippingService < ActiveRecord::Base
  has_many :shipping_service_options, :class_name => 'Ebay::ShippingServiceOption'

  def request
    [:shipping_service => self.name]
  end
end
