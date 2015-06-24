class AddSynonymsToProduct < ActiveRecord::Migration
  def change
    add_column :products, :synonyms, :string
  end
end
