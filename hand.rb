class Hand

  attr_reader :cards

  @cards = []

  def take_card(deck)
    @cards << deck.pop
  end

  def score
    score = 0
    @cards.each { |card| score += card.value }
    score
  end

  def list
    @cards.each{ |card| puts card }
  end
end
