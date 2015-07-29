class Purchase
  include ActiveModel::Model

  attr_accessor :ip_address

  attr_accessor :contact_phone, :contact_email
  attr_accessor :shipping_address_name, :shipping_address_address1, :shipping_address_address2,
                :shipping_address_city, :shipping_address_state, :shipping_address_zip
  attr_accessor :card_first_name, :card_last_name, :card_type, :card_number, :card_verification, :card_expiration_month,
                :card_expiration_year
  attr_accessor :billing_address_name, :billing_address_address1, :billing_address_address2,
                :billing_address_city, :billing_address_state, :billing_address_zip

  def credit_card
    @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
        :brand               => card_type,
        :number             => card_number,
        :verification_value => card_verification,
        :month              => card_expiration_month,
        :year               => card_expiration_year,
        :first_name         => card_first_name,
        :last_name          => card_last_name
    )
  end

  def address
    @address ||= Address.new(
        name: shipping_address_name, address1: shipping_address_address1, address2: shipping_address_address2,
                      city: shipping_address_city, state: shipping_address_state, zip: shipping_address_zip)
  end
end