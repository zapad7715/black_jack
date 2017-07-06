class Card

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def value
    return 10 if ['J', 'Q', 'K']
    return 11 if ['A']
    return @value
  end

  def to_s
    "#{@value}#{@suit}"
  end
end
