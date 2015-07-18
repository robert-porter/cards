class AddShippingPriceCentsToItem < ActiveRecord::Migration
  def change
    add_column :items, :shipping_price_cents, :integer
  end
end
