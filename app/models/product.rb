class Product < ActiveRecord::Base
  has_many :items
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

  def remove_item_references
    self.items.each do |item|
      item.team = Product.none_value
      item.save
    end
  end

  def self.none_value
    self.find_or_create_by :name => 'None'
  end

  def self.sorted
    self.all.sort_by do |product|
      if product.name == 'None'
        ''
      else
        product.name
      end
    end
  end
end
