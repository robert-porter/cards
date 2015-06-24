class CreateItemNameWordMaps < ActiveRecord::Migration
  def change
    create_table :item_name_word_maps do |t|
      t.belongs_to :item, index: true
      t.belongs_to :name_word, index: true
      t.timestamps null: false
    end
  end
end
