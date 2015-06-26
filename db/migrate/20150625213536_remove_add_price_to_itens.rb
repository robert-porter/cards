class RemoveAddPriceToItens < ActiveRecord::Migration
  def change
    drop_table :add_price_to_items
  end
end
