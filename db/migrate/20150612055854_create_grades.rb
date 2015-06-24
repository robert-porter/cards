class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.string :name
      t.integer :grade
      t.timestamps null: false
    end
  end
end
