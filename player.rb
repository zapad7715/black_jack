# frozen_string_literal: true

require_relative 'bank'

class Player
  include Bank

  attr_reader :bank, :cards

  def initialize(name, bank)
    @bank = bank
    @cards = []
    @name = name
    validate!
  end

  def cleanup_cards
    @cards = []
  end

  def each(&block)
    @cards.each(&block)
  end

  def score
    values = []
    @cards.each { |card| values << card.value }
    values[values.index(values.max)] = 1 if values.sum > 21 && values.max == 11
    values.sum
  end

  def size
    @cards.size
  end

  def take_card(deck)
    @cards << deck.cards.pop
  end

  def to_s
    @name.to_s
  end

  private

  def validate!
    raise 'Name cannot be empty string.' if @name.empty?
  end
end
