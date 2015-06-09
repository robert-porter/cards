class Item < ActiveRecord::Base
  #attr_accessible :image
  mount_uploader :image, ImageUploader

  acts_as_taggable

  self.per_page = 10
end
