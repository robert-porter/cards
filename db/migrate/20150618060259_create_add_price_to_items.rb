class CreateAddPriceToItems < ActiveRecord::Migration
  def change
    create_table :add_price_to_items do |t|
      t.integer :price_cents

      t.timestamps null: false
    end
  end
end
