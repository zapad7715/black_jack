class Hand

  attr_reader :cards

  @cards = []

  def take_card(deck)
    @cards << deck.pop
  end

  def score
    values = []
    @cards.each { |card| values << card.value }
    if values.sum > 21 && values.max == 11
      values[values.index(values.max)] = 1
    end
    values.sum
  end

  def list
    @cards.each{ |card| puts card }
  end
end
