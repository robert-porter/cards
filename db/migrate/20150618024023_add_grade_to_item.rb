class AddGradeToItem < ActiveRecord::Migration
  def change
    add_column :items, :grade, :integer
  end
end
