class CreateEbayShippingServiceOptions < ActiveRecord::Migration
  def change
    create_table :ebay_shipping_service_options do |t|
      t.integer :shipping_service_id
      t.decimal :shipping_service_cost, :precision => 16, :scale => 2

      t.timestamps null: false
    end
  end

end
