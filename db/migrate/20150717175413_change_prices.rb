class ChangePrices < ActiveRecord::Migration
  def change
    change_column :items, :price_cents, :integer, :default => 0
    change_column :items, :shipping_price_cents, :integer, :default => 0
  end
end
