class Manufacturer < ActiveRecord::Base
  has_many :item
  validates_presence_of :name
  validates_uniqueness_of :name

  before_destroy :remove_from_search_suggestions
  after_save :save_to_search_suggestions

  def save_to_search_suggestions
    SearchSuggestion.add_term self.name
  end

  def remove_from_search_suggestions
    SearchSuggestion.remove_term self.name
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
