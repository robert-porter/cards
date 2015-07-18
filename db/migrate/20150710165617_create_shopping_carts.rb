class CreateShoppingCarts < ActiveRecord::Migration
  def change
    create_table :shopping_carts do |t|
      t.datetime :purchased_at

      t.timestamps null: false
    end
  end
end
