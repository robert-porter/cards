class Ebay::ShippingServiceOption < ActiveRecord::Base
  belongs_to :shipping_service, :class_name => 'Ebay::ShippingService'

  def request
    [:shipping_service => self.shipping_service,
     :shipping_service_cost => self.shipping_service_cost ]
  end
end
