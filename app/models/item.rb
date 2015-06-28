class Item < ActiveRecord::Base
  has_many :item_name_word_maps, :dependent => :destroy
  has_many :name_words, through: :item_name_word_maps
  has_many :taggings, :dependent => :destroy
  has_many :tags, through: :taggings
  belongs_to :team
  belongs_to :manufacturer
  belongs_to :product

  validates_presence_of :name

  before_create :default_values
  after_save :save_name_words

  before_destroy :remove_from_search_suggestions
  after_save :save_to_search_suggestions

  def save_to_search_suggestions
    SearchSuggestion.add_term self.name
  end

  def remove_from_search_suggestions
    SearchSuggestion.remove_term self.name
  end

  mount_uploader :image, ImageUploader

  def annotated_name
    name = ''
    if self.year != nil && self.year != 0
      name << self.year.to_s << ' '
    end
    if self.manufacturer.name != 'None'
      name << self.manufacturer.name << ' '
    end
    name << self.name
  end

  def default_values
    if self.team == nil
      self.team = Team.none_value
    end
    if self.manufacturer == nil
      self.manufacturer = Manufacturer.none_value
    end
    if self.product == nil
      self.product = Product.none_value
    end

    self.quantity = 1
    self.views = 0
  end

  def tag_list
    self.tags.map(&:name).join(', ')
  end

  def tag_list=(str)
    tag_names = str.split(',')
    tag_names.each do |name|
      tag = Tag.where(:name => name.strip).first
      if tag != nil
        tagging = Tagging.where(tag_id: tag.id, item_id: self.id).first
        if tagging == nil
          Tagging.create tag_id: tag.id, :item_id => self.id
        else
          #warn here?
        end
      else
        #warn here?
      end
    end
  end

  def save_name_words
    words = self.name.split(' ')
    words.each do |name|
      name_word = NameWord.find_or_create_by(:word => name.strip.upcase)
      if name_word != nil
        item_name_word_map = ItemNameWordMap.where(name_word_id: name_word.id, item_id: self.id).first
        if item_name_word_map == nil
          ItemNameWordMap.create name_word_id: name_word.id, :item_id => self.id
        else
          #warn here?
        end
      else
        #warn here?
      end
    end
  end


end
