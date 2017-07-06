class Game
  class << self
    attr_accessor :deck
  end

  def initialize(deck)
    self.class.deck = deck
  end
end
