class CreateEbayReturnPolicies < ActiveRecord::Migration
  def change
    create_table :ebay_return_policies do |t|
      t.string :name
      t.text :description
      t.string :refund_option
      t.string :returns_accepted_option
      t.string :returns_within_option
      t.string :shipping_cost_paid_by

      t.timestamps null: false
    end
  end
end
