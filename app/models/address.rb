class Address < ActiveRecord::Base
  has_many :orders


  def self.create_from_pay_pal_notification_params params
    Address.create name: params[:address_name],
                   street: params[:address_street],
                   city: params[:address_city],
                   state: params[:address_state],
                   country: params[:address_country],
                   zip: params[:address_zip]
  end

  def to_active_shipping_location
    @as_address ||= ActiveShipping::Location.new(name: name,
                                              address1: address1,
                                              address2: address2,
                                              city: city,
                                              state: state,
                                              country: 'US',
                                              zip: zip)
  end

  def valid?
    return false if name == nil || name.strip == ''
    return false if address1 == nil || address1.strip == ''
    return false if city == nil || city.strip == ''
    return false if state == nil || state.strip == ''
    return false if zip == nil || zip.strip == ''
    return Shipping.stamps.validate_address(to_active_shipping_location)
  end

  def errors
    e = []
    e << 'name cannot be empty' if name == nil || name.strip == ''
    e << 'address1 cannot be empty' if address1 == nil || address1.strip == ''
    e << 'city cannot be empty' if city == nil || city.strip == ''
    e << 'state cannot be empty' if state == nil || state.strip == ''
    e << 'zip cannot be empty' if zip == nil || zip.strip == ''
    if e == []
      e << 'Address failed to validate' if Shipping.stamps.validate_address(to_active_shipping_location)
    end
    e
  end
end
