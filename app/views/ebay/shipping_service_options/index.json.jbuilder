json.array!(@ebay_shipping_service_options) do |ebay_shipping_service_option|
  json.extract! ebay_shipping_service_option, :id, :shipping_service_id, :shipping_service_cost
  json.url ebay_shipping_service_option_url(ebay_shipping_service_option, format: :json)
end
