class AddDefaultProcessedToFalseToOrder3 < ActiveRecord::Migration
  def change
    change_column :orders, :processed, :boolean, :default => false
  end
end
