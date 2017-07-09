# frozen_string_literal: true

require_relative 'player'

class Dealer < Player
  def take_card(deck)
    raise "#{@name} пропускает ход." if forbidden_take_card? || @cards.size == 3
    super
  end

  private

  def forbidden_take_card?
    # In life there must be a place for the occasion
    score >= 17 && (0..91).cover?(rand(100))
  end
end
