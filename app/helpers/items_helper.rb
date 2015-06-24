module ItemsHelper
end

class Search
  attr_accessor :name_words
  attr_accessor :all_or_any
  attr_accessor :team_ids
  attr_accessor :manufacturer_ids
  attr_accessor :product_ids
  attr_accessor :tag_ids
  attr_accessor :years
  attr_accessor :year_min
  attr_accessor :year_max
  attr_accessor :grade
  attr_accessor :grade_min
  attr_accessor :grade_max
  attr_accessor :price
  attr_accessor :price_min
  attr_accessor :price_max
  attr_accessor :description
  attr_accessor :sort_by
end

def param_to_integer(param)
  if param == nil or param == ''
    nil
  else
    param
  end
end

def param_to_integer_array(param)
  if param == nil || param == ''
    []
  else
    param.split(',').map {|id| id }
  end
end

def advanced_search(params, offset, limit)

  search = Search.new

  all_or_any = (params[:all_or_any].to_sym if params[:all_or_any]) || :any

  if params[:name_words] != nil
    search.name_words = params[:name_words].split(' ')
  else
    search.name_words = []
  end

  search.all_or_any = all_or_any

  search.team_ids = param_to_integer_array params[:teams]
  search.manufacturer_ids = param_to_integer_array params[:manufacturers]
  search.product_ids = param_to_integer_array params[:products]
  search.tag_ids = param_to_integer_array params[:tags]
  search.years = param_to_integer_array params[:year]
  search.year_min = param_to_integer params[:year_min]
  search.year_min = param_to_integer params[:year_min]
  search.grade = param_to_integer params[:grade]
  search.grade_min = param_to_integer params[:grade_min]
  search.grade_min = param_to_integer params[:grade_min]
  search.price = param_to_integer params[:price]
  search.price_min = param_to_integer params[:price_min]
  search.price_min = param_to_integer params[:price_min]

  if params[:sort_by] != nil
    search.sort_by = params[:sort_by]
  else
    search.sort_by = :relevance
  end

  operator = ' or '
  if params[:all_or_any] != nil && params[:all_or_any] == 'all'
    operator = ' and '
  end

  search_query(search, operator, offset, limit)
end

def parse_query(params, offset, limit)

  search = Search.new

  operator = 'or'
  if params[:all_or_any] == 'all'
    operator = 'and'
  end
  operator = ' ' << operator << ' '

  query = params[:q]
  search.sort_by = params[:sort_by].to_sym if params[:sort_by] != nil else :newest

  words = query.split

  if words.size == 0
    return order_query(Item.all, search.sort_by).limit(limit).offset(offset), Item.count
  end

  search.name_words = words
  search.team_ids = match_words(words, Team)
  search.manufacturer_ids = match_words(words, Manufacturer)
  search.product_ids = match_words(words, Product)
  search.tag_ids = match_words(words, Tag)
  search.years = match_years(words)
  search.year_min, search.year_max = match_year_range(words)


  search_query search, operator, offset, limit
end

def non_join_query(search, operator)
  if search.team_ids == [] &&
      search.manufacturer_ids == [] &&
      search.product_ids == [] &&
      search.years == [] &&
      (search.year_min == nil || year_max == nil)
    return []
  end

  query = ''

  query << 'select items.*, ('

  conditions = search.team_ids.map {|id| ' case when team_id = ' << id.to_s << ' then 1 else 0 end '} +
      search.manufacturer_ids.map {|id| ' case when manufacturer_id = ' << id.to_s << ' then 1 else 0 end '} +
      search.product_ids.map {|id| ' case when product_id = ' << id.to_s << ' then 1 else 0 end '} +
      search.years.map { |year| ' case when year = ' << year.to_s << ' then 1 else 0 end ' }

  if search.year_min != nil && search.year_max != nil
    conditions = conditions +
        [' case when year >= ' << search.year_min.to_s <<
             ' and year <= ' << search.year_max.to_s << ' then 1 else 0 end ']
  end
  fragment = conditions.join(' + ')
  query << fragment
  query << ') as matches
  from items where ('

  conditions = search.team_ids.map {|id| 'team_id = ' + id.to_s } +
      search.manufacturer_ids.map {|id| 'manufacturer_id = ' + id.to_s } +
      search.product_ids.map {|id| 'product_id = ' + id.to_s } +
      search.years.map { |year| ' year = ' << year.to_s }
  if search.year_min != nil && search.year_max != nil
    conditions = conditions +
        [' year >= ' << search.year_min.to_s << ' and year <= ' << search.year_max.to_s ]
  end
  fragment = conditions.join(operator)
  query << fragment
  query << ')group by items.id '
  [query]
end

def name_word_query(search, operator)
  if search.name_words.size > 0
    ['select items.*,
      (select count(*) from item_name_word_maps join name_words
        on name_words.id = item_name_word_maps.name_word_id and
        item_name_word_maps.item_id = items.id and( ' <<
      search.name_words.map {|word| ' name_words.word = ' "'#{word.upcase}'" }.join(' or ') <<
      ')) as matches
    from items join item_name_word_maps
      on item_name_word_maps.item_id = items.id
    join name_words
      on name_words.id = item_name_word_maps.name_word_id and( ' <<
      search.name_words.map {|word| ' name_words.word = ' "'#{word.upcase}'" }.join(' or ') <<
    ')group by items.id ']
  else
    []
  end
end

def tag_query(search, operator)

  if search.tag_ids.size > 0
    ['select items.*,
    (select count(*) from taggings join tags
      on tags.id = taggings.tag_id and
      taggings.item_id = items.id and(' <<
    search.tag_ids.map {|id| ' tags.id = ' << id.to_s }.join(' or ') <<

    ')) as matches
    from items join taggings
      on taggings.item_id = items.id
    join tags
      on tags.id = taggings.tag_id and(' <<
    search.tag_ids.map {|id| ' tags.id = ' << id.to_s }.join(' or ') <<
    ') group by items.id']
  else
    []
  end
end

def search_query(search, operator, offset, limit)

  query = 'select id, created_at, year, views, sum(matches) as matches from('
  subquery = (non_join_query(search, operator) +
      name_word_query(search, operator) +
      tag_query(search, operator)).join(' union all ')


  if subquery == ''
    return order_query(Item.all, search.sort_by).limit(limit).offset(offset), Item.count
  end

  query << subquery
  query <<
  ')as subquery
  group by
  id, created_at, year, views '

  if operator == ' and '
    query <<
      ' having sum(matches) >= ' << search.name_words.size.to_s
  end
  query << order_by_sql(search.sort_by)

  results = ActiveRecord::Base.connection.execute(query)

  items = []
  offset.upto([results.num_tuples - 1, offset + limit - 1].min).each do |i|
    items.append Item.find(results[i]['id'].to_i)
  end

  return items, results.num_tuples
end

def match_words(words, model)
  match_ids = []
  words.each do |word|
    results = model.where('upper(name) like ?', word.upcase)
    if results.size > 0
      results.each do |team|
        match_ids << team.id
      end
    end
  end
  return match_ids
end

def match_years(words)
  years = []
  words.each do |word|
    if /^(19|20)\d{2}$/.match word
      years << word
    elsif /^{2}\d/.match word
      years.push('19' << word)
      years.push('20' << word)
    end
  end
  years
end

def match_year_range(words)
  words.each do |word|
    if /^(19|20)\d{2}-(19|20)\d{2}$/.match word
      years = word.split('-')
      year_min = years[0].to_i
      year_max = years[1].to_i
      if year_min <= year_max
        return years[0], years[1]
      end
    end
  end
  return nil, nil
end


def order_query(query, sort_by)
  if sort_by == :newest
    return query.order(created_at: :desc)
  elsif sort_by == :oldest
    return query.order(created_at: :asc)
  elsif sort_by == :year_highest_to_lowest
    return query.order(year: :desc)
  elsif sort_by == :year_lowest_to_highest
    return query.order(year: :asc)
  elsif sort_by == :grade_highest_to_lowest
    return query.order(grade: :desc)
  elsif sort_by == :grade_lowest_to_highest
    return query.order(grade: :asc)
  elsif sort_by == :most_views
    return query.order(views: :desc)
  elsif sort_by == :least_views
    return query.order(views: :asc)
  else
    return query
  end
end

def order_by_sql(sort_by)
  if sort_by == :newest
    ' order by created_at desc '
  elsif sort_by == :oldest
    ' order by created_at asc '
  elsif sort_by == :year_highest_to_lowest
    ' order by year desc '
  elsif sort_by == :year_lowest_to_highest
    ' order by year asc '
  elsif sort_by == :grade_highest_to_lowest
    ' order by grade desc '
  elsif sort_by == :grade_lowest_to_highest
    ' order by grade asc '
  elsif sort_by == :most_views
    ' order by views desc '
  elsif sort_by == :least_views
    ' order by views asc '
  else
    ' order by matches desc '
  end
end




