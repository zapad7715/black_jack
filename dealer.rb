# frozen_string_literal: true

require_relative 'player'

class Dealer < Player
  def take_card(deck)
    raise 'Dealer pass.' if allow_take_card?
    super
  end

  private

  def allow_take_card?
    # In life there must be a place for the occasion
    score >= 17 && (0..91).cover?(rand(100))
  end
end
