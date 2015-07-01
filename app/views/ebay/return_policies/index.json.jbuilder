json.array!(@ebay_return_policies) do |ebay_return_policy|
  json.extract! ebay_return_policy, :id, :name, :description, :refund_option, :returns_accepted_option, :returns_within_option, :shipping_cost_paid_by
  json.url ebay_return_policy_url(ebay_return_policy, format: :json)
end
