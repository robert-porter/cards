class Item < ActiveRecord::Base
  #attr_accessible :image
  mount_uploader :image, ImageUploader

  self.per_page = 10
end
