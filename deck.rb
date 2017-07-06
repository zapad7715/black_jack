class Deck

  def initialize
    @cards = create
  end

  def create
    cards = []
    ['+', '<3', '<>', '^'].each do |suit|
      (2..10).each do |value|
        cards << Card.new(suit, value)
      end
      ['J', 'Q', 'K', 'A'].each do |value|
        cards << Card.new(suit, value)
      end
    end
    cards.shuffle
  end
end
