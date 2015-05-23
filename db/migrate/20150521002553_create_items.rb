class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.string :image_uri
      t.string :tags

      t.timestamps null: false
    end
  end
end
