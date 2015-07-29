class AddPayPalProResponseToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :pal_pal_pro_response, :text
  end
end
