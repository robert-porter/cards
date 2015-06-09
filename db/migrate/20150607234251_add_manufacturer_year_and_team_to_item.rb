class AddManufacturerYearAndTeamToItem < ActiveRecord::Migration
  def change
    add_column :items, :mfg, :string
    add_column :items, :year, :integer
    add_column :items, :team, :string
  end
end
