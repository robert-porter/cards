
class SearchSuggestion


  def self.seed
    Team.find_each do |o|
      self.add_term o.name
    end
    Manufacturer.find_each do |o|
      self.add_term o.name
    end
    Product.find_each do |o|
      self.add_term o.name
    end
    Tag.find_each do |o|
      self.add_term o.name
    end
    NameWord.find_each do |o|
      self.add_term o.word
    end
    Item.find_each do |o|
      self.add_term o.name
    end
    Grade.find_each do |o|
      self.add_term o.name
    end

  end

  def self.add_term(term)
    1.upto(term.length - 1) do |n|
      prefix = term[0, n]
      $redis.zadd "search-suggestions:#{prefix.downcase}", 1, term.downcase
    end
  end

  def self.remove_term(term)
    1.upto(term.length - 1) do |n|
      prefix = term[0, n]
      $redis.zrem "search-suggestions:#{prefix.downcase}", term.downcase
    end
  end

  def self.terms_for(prefix)
    $redis.zrevrange "search-suggestions:#{prefix.downcase}", 0, 9
  end

end