module PayPalPro

  def purchase(order, credit_card)
    response = GATEWAY.purchase(order.price_cents, credit_card, purchase_options)
    order.save if response.success?
    response.success?
  end

  def purchase_options
    {
        :ip => ip_address,
        :billing_address => {
            :name     => "Ryan Bates",
            :address1 => "123 Main St.",
            :city     => "New York",
            :state    => "NY",
            :country  => "US",
            :zip      => "10001"
        }
    }
  end

  def credit_card
    @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
        :type               => card_type,
        :number             => card_number,
        :verification_value => card_verification,
        :month              => card_expires_on.month,
        :year               => card_expires_on.year,
        :first_name         => first_name,
        :last_name          => last_name
    )
  end
end