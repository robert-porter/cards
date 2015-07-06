class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.text :notification_params
      t.string :status
      t.datetime :purchased_at
      t.integer :item_id
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
