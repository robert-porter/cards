class AddFirstNameLastNameAndEmailToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :first_name, :string
    add_column :orders, :last_name, :string
    add_column :orders, :email, :string
  end
end
