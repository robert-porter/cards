class RemoveTagsFromItem < ActiveRecord::Migration
  def change
    remove_column :items, :tags
  end
end
