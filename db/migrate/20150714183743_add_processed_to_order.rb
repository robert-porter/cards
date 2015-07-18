class AddProcessedToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :processed, :boolean
  end
end
