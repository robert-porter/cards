class NameWord < ActiveRecord::Base
  validates_presence_of :word
  validates_uniqueness_of :word

  before_destroy :remove_from_search_suggestions
  after_save :save_to_search_suggestions

  def save_to_search_suggestions
    SearchSuggestion.add_term self.word
  end

  def remove_from_search_suggestions
    SearchSuggestion.remove_term self.word
  end

  before_save :upcase_word

  def upcase_word
    self.word = word.upcase
  end

  has_many :item_name_word_maps
  has_many :items, through: :item_name_word_maps
end
