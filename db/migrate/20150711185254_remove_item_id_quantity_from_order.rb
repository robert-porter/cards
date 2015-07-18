class RemoveItemIdQuantityFromOrder < ActiveRecord::Migration
  def change
    remove_column :orders, :item_id, :integer
    remove_column :orders, :quantity, :integer
  end
end
