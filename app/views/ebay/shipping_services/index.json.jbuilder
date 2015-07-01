json.array!(@ebay_shipping_services) do |ebay_shipping_service|
  json.extract! ebay_shipping_service, :id, :name
  json.url ebay_shipping_service_url(ebay_shipping_service, format: :json)
end
