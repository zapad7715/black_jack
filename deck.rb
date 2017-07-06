class Deck
  SUITS = ['+', '<3', '<>', '^']
  CARD_VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']

  attr_reader :cards

  def initialize
    @cards = create
  end

  def create
    cards = []
    SUITS.each do |suit|
      CARD_VALUES.each do |value|
        cards << Card.new(suit, value)
      end
    end
    cards.shuffle
  end
end
