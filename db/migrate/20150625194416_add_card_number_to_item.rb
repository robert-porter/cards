class AddCardNumberToItem < ActiveRecord::Migration
  def change
    add_column :items, :card_number, :string
  end
end
