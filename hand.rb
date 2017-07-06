# frozen_string_literal: true

class Hand
  attr_reader :cards

  def initialize
    @cards = []
  end

  def take_card(deck)
    @cards << deck.cards.pop
  end

  def score
    values = []
    @cards.each { |card| values << card.value }
    values[values.index(values.max)] = 1 if values.sum > 21 && values.max == 11
    values.sum
  end

  def list
    @cards.each { |card| puts card }
  end
end
