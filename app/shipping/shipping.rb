module Shipping
  @integration_id =  'cf607fdd-8752-40fa-bec9-b27b7d39cbde'
  @username = 'DadsCards'
  @password = 'postage1'
  @test = true
  @stamps = ActiveShipping::Stamps.new(integration_id: @integration_id,
                                       username: @username,
                                       password: @password,
                                       test: @test)

  PACKAGES = [
      'Postcard',
      'Letter',
      'Large Envelope or Flat',
      'Thick Envelope',
      'Package',
      'Flat Rate Box',
      'Small Flat Rate Box',
      'Large Flat Rate Box',
      'Flat Rate Envelope',
      'Flat Rate Padded Envelope',
      'Large Package',
      'Oversized Package',
      'Regional Rate Box A',
      'Regional Rate Box B',
      'Regional Rate Box C',
      'Legal Flat Rate Envelope'
  ]

  ADD_ONS = {
      'SC-A-HP'    => 'Hidden Postage',
      'SC-A-INS'   => 'Insurance',
      'SC-A-INSRM' => 'Insurance for Registered Mail',
      'US-A-CM'    => 'Certified Mail',
      'US-A-COD'   => 'Collect on Delivery',
      'US-A-COM'   => 'Certificate of Mailing',
      'US-A-DC'    => 'USPS Delivery Confirmation',
      'US-A-ESH'   => 'USPS Express - Sunday / Holiday Guaranteed',
      'US-A-INS'   => 'USPS Insurance',
      'US-A-NDW'   => 'USPS Express - No Delivery on Saturdays',
      'US-A-RD'    => 'Restricted Delivery',
      'US-A-REG'   => 'Registered Mail',
      'US-A-RR'    => 'Return Receipt Requested',
      'US-A-RRM'   => 'Return Receipt for Merchandise',
      'US-A-SC'    => 'USPS Signature Confirmation',
      'US-A-SH'    => 'Special Handling',
      'US-A-NND'   => 'Notice of non-delivery',
  }

  def self.stamps
    @stamps
  end

  def self.get_rates(package, destination, package_type)
    origin = ActiveShipping::Location.new(
        name: 'Robert Porter',
        address1: '4105 Greystone Drive',
        city: 'Austin',
        state: 'TX',
        country: 'US',
        zip: '78731')

    return @stamps.find_rates(origin, destination.to_active_shipping_location, package, {package_type: package_type})

  end


  def self.purchase_shipping(package, destination)
    origin = ActiveShipping::Location.new(
        name: 'Robert Porter',
        address1: '4105 Greystone Drive',
        city: 'Austin',
        state: 'TX',
        country: 'US',
        zip: '78731')
    return @stamps.create_shipment(origin, destination.to_active_shipping_location, package, [], {service: 'US-FC', package_type: 'Large Envelope or Flat'})

  end

end