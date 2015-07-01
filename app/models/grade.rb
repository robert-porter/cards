class Grade < ActiveRecord::Base
  #before_destroy :remove_from_search_suggestions
  #after_save :save_to_search_suggestions, :remove_item_references
  validates_presence_of :numeric_grade
  validates_uniqueness_of :numeric_grade
  has_many :items

  def save_to_search_suggestions
    SearchSuggestion.add_term self.numeric_grade.to_s
  end

  def remove_from_search_suggestions
    SearchSuggestion.remove_term self.numeric_grade.to_s
  end

  def remove_item_references
    self.items.each do |item|
      item.grade = Grade.none_value
      item.save
    end
  end
end
