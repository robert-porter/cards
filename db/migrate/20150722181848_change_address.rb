class ChangeAddress < ActiveRecord::Migration
  def change
    rename_column :addresses, :street, :address1
    add_column :addresses, :address2, :string
  end
end
