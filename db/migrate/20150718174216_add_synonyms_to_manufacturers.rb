class AddSynonymsToManufacturers < ActiveRecord::Migration
  def change
    add_column :manufacturers, :synonyms, :string
  end
end
