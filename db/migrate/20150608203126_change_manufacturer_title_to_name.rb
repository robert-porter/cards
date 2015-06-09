class ChangeManufacturerTitleToName < ActiveRecord::Migration
  def change
    rename_column :manufacturers, :title, :name

  end
end
