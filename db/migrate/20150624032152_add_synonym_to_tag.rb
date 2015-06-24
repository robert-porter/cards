class AddSynonymToTag < ActiveRecord::Migration
  def change
    add_column :tags, :synonyms, :string
  end
end
