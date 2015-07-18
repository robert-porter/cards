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
end
