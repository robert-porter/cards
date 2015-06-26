class AddNumericGradeToItem < ActiveRecord::Migration
  def change
    add_column :items, :item, :string
    add_column :items, :numeric_grade, :integer
  end
end
