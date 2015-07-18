class ChangeOrderShippingAddressIdNameToShippingAddressId < ActiveRecord::Migration
  def change
    rename_column :orders, :shipping_address_id, :address_id
  end
end
