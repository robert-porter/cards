class FixGrade < ActiveRecord::Migration
  def change
    rename_column :grades, :name, :self_graded_name
    rename_column :grades, :grade, :numeric_grade
    add_column :grades, :professionally_graded_name, :string
    add_column :grades, :self_graded_synonyms, :string
    add_column :grades, :professionally_graded_synonyms, :string
  end
end
