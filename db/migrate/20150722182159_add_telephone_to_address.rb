class AddTelephoneToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :telephone, :string
  end
end
