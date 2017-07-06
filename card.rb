class Card
  attr_reader :suit

  def initialize(suit:, value:)
    @suit = suite
    @value = value
  end

  def value
    return 10 if ['J', 'Q', 'K']
    return 11 if ['A']
    return @value
  end
end
