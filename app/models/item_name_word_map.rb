class ItemNameWordMap < ActiveRecord::Base
  validates_presence_of :item_id, :name_word_id

  belongs_to :name_word
  belongs_to :item
end
