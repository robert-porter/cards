class RemoveGradeFromItem < ActiveRecord::Migration
  def change
    remove_column :items, :grade, :integer
  end
end
