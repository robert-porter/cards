class CreateItemWordNameMaps < ActiveRecord::Migration
  def change
    create_table :item_word_name_maps do |t|
      t.belongs_to :item, index: true
      t.belongs_to :name_word, index: true

      t.timestamps null: false
    end
  end
end
