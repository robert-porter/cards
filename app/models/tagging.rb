class Tagging < ActiveRecord::Base
  validates_presence_of :tag_id
  validates_presence_of :item_id
  belongs_to :tag
  belongs_to :item
end
