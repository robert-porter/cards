class RemoveUnitPriceCentsFromLineItem < ActiveRecord::Migration
  def change
    remove_column :line_items, :unit_price_cents, :integer
  end
end
