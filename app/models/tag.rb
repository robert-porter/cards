class Tag < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  has_many :taggings, :dependent => :destroy
  has_many :items, through: :taggings

  before_destroy :remove_from_search_suggestions
  after_save :save_to_search_suggestions

  def save_to_search_suggestions
    SearchSuggestion.add_term self.name
  end

  def remove_from_search_suggestions
    SearchSuggestion.remove_term self.name
  end

  def self.sorted
    self.all.sort_by { |tag| tag.name }
  end

end
