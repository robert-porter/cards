module ShippingPresenter
  def self.service_types
    types = []
    ActiveShipping::Stamps::SERVICE_TYPES.each do |key, value|
      types << [value, key]
    end
    types
  end

  def self.add_ons
    types = []
    ActiveShipping::Stamps::ADD_ONS.each do |key, value|
      types << [value, key]
    end
    types
  end

  def self.package_types
    p = []
    ActiveShipping::Stamps::PACKAGE.each do |package|
      p << [package, package]
    end
    p
  end

  def self.rate_estimates
    @rates = Shipping.purchase_shipping.rates
  end
end