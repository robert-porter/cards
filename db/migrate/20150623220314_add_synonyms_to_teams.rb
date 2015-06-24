class AddSynonymsToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :synonyms, :string
  end
end
