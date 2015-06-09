module ItemsHelper
end

# defines a little query language [and, or, ()], and converts to a sql query.

def parse_query_language(query)
  parser = Parser.new(query)
  parser.parse
end


class AST
end


class BinaryOperatorNode < AST
  def initialize(left, right, operator)
    @left = left
    @right = right
    @operator = operator
  end

  def evaluate
    if @operator == :or
      @left.evaluate.union(@right.evaluate)
    elsif @operator == :and
      @left.evaluate.merge(@right.evaluate)
    else #:no_operator
      @left.evaluate.union(@right.evaluate)
    end
  end

  attr_reader :left
  attr_reader :right
  attr_reader :operator

end

class TagNode < AST
  def initialize(tag)
    @tag = tag
  end

  def evaluate
    Item.tagged_with(@tag)
  end

  attr_reader :tag

end

class Token
  def initialize(type, value)
    @type = type
    @value = value
  end

  attr_reader :type
  attr_reader :value
end

class Parser
  def initialize(query)
    lex(query)
  end


  def lex(query)
    @tokens = []
    index = 0
    token = ''

    while index < query.size
      if query[index] == '('
        @tokens << Token.new(:open_paren, query[index])
        index = index + 1
      elsif query[index] == ')'
        @tokens << Token.new(:close_paren, query[index])
        index = index + 1
      elsif query[index] == ' '
        index = index + 1
      else
        word = ''
        while query[index] =~ /[[:alpha:]]/
          word << query[index]
          index = index + 1
        end

        if word.upcase == 'AND'
          @tokens << Token.new(:and, word)
        elsif word.upcase == 'OR'
          @tokens << Token.new(:or, word)
        elsif word.upcase == 'NOT'
          @tokens << Token(:not, word)
        else
          @tokens << Token.new(:word, word)
        end
      end
    end
    @index = 0
  end

  def tokens
    @tokens
  end

  def parse
    parse_or
  end

  def parse_or
    left = parse_and
    while @index < @tokens.size && @tokens[@index].type == :or
      @index = @index + 1 #eat the 'or'
      right = parse_and
      if @index < @tokens.size && @tokens[@index].type == :or
        left = BinaryOperatorNode.new(left, right, :or)
      else
        return BinaryOperatorNode.new(left, right, :or)
      end

    end

    left
  end

  def parse_and
    left = parse_no_symbol
    while @index < @tokens.size && @tokens[@index].type == :and
      @index = @index + 1 #eat the 'and'
      right = parse_no_symbol
      if@index < @tokens.size && @tokens[@index].type == :or
        left = BinaryOperatorNode.new(left, right, :and)
      else
        return BinaryOperatorNode.new(left, right, :and)
      end
    end

    left
  end

  def parse_no_symbol
    left = parse_value
    while @index < @tokens.size && @tokens[@index].type == :word
      right = parse_value
      if @index == @tokens.size || (@index < @tokens.size && @tokens[@index].type == :word)
        left = BinaryOperatorNode.new(left, right, :no_symbol)
      else
        return BinaryOperatorNode.new(left, right, :no_symbol)
      end
    end
    left
  end

  def parse_value

    if @tokens[@index].type == :open_paren
      @index = @index + 1

      value = parse()

      if @index < @tokens.size
        if @tokens[@index].type == :close_paren
          @index = @index + 1
        end
      end

      return value
    elsif @tokens[@index] == :close_paren #change this...
      @index = @index + 1
    else
      @index = @index + 1
      TagNode.new(@tokens[@index - 1].value)
    end

  end

end

