# frozen_string_literal: true

class Game
  def initialize(player)
    @dealer = Dealer.new
    @player = player
    @deck = Deck.new
    destribution(@deck)
  end

  def reset_deck
    @deck = Deck.new
  end

  def distribution(deck)
    2.times { @player.hand.take_card(deck) }
    2.times { @dealer.hand.take_card(deck) }
  end
end
