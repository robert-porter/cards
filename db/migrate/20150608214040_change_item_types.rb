class ChangeItemTypes < ActiveRecord::Migration
  def change
    add_column :items, :manufacturer_id, :integer
    add_column :items, :team_id, :integer

    remove_column :items, :manufacturer
    remove_column :items, :team
  end
end
