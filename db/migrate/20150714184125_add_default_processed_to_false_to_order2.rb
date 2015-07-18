class AddDefaultProcessedToFalseToOrder2 < ActiveRecord::Migration
  def change
    change_column :orders, :processed, :boolean, :default => true
  end
end
