class CreateEbayShippingServices < ActiveRecord::Migration
  def change
    create_table :ebay_shipping_services do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
