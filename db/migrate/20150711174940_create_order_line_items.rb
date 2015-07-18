class CreateOrderLineItems < ActiveRecord::Migration
  def change
    create_table :order_line_items do |t|
      t.integer :item_id
      t.integer :quantity
      t.integer :order_id

      t.timestamps null: false
    end
  end
end
