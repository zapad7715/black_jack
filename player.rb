# frozen_string_literal: true

require_relative 'bank'

class Player
  include Bank

  attr_reader :bank, :cards

  def initialize
    @bank = 100
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
end
