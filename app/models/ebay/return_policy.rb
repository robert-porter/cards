class Ebay::ReturnPolicy < ActiveRecord::Base
  def request
    [:return_policy => [
         :description => self.description,
         :refund_option => self.refund_option,
         :returns_accepted_option => self.returns_accepted_option,
         :returns_within_option => self.returns_within_option,
         :shipping_cost_paid_by => self.shipping_cost_paid_by
     ]
    ]
  end
end
