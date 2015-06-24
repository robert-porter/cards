class Grade < ActiveRecord::Base
  before_destroy :remove_from_search_suggestions
  after_save :save_to_search_suggestions
  validates_presence_of :name
  validates_uniqueness_of :name

  def save_to_search_suggestions
    SearchSuggestion.add_term self.name
  end

  def remove_from_search_suggestions
    SearchSuggestion.remove_term self.name
  end
end
