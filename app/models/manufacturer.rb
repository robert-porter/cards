class Manufacturer < ActiveRecord::Base
  has_many :items
  validates_presence_of :name
  validates_uniqueness_of :name

  #before_destroy :remove_from_search_suggestions, :remove_item_references
  #after_save :save_to_search_suggestions, :remove_item_references

  def save_to_search_suggestions
    SearchSuggestion.add_term self.name
  end

  def remove_from_search_suggestions
    SearchSuggestion.remove_term self.name
  end

  def remove_item_references
    self.items.each do |item|
      item.team = Manufacturer.none_value
      item.save
    end
  end

  def self.none_value
    self.find_or_create_by :name => 'None'
  end

  def self.sorted
    self.all.sort_by do |manufacturer|
        if manufacturer.name == 'None'
          ''
        else
          manufacturer.name
        end
    end
  end
end
