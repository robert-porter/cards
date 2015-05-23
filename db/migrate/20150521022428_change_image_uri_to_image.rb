class ChangeImageUriToImage < ActiveRecord::Migration
  def change
    rename_column :items, :image_uri, :image
  end
end
