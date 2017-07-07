# frozen_string_literal: true

require_relative 'bank'

class Player
  include Bank

  attr_reader :bank, :cards

  def initialize(name)
    @bank = 100
    @cards = []
    @name = name
    validate!
  end

  def hide_cards
    puts "Карты #{@name}:"
    player.cards.each { |card| puts "Карта: *. Очков: *" }
  end

  def take_card(deck)
    @cards << deck.cards.pop
  end

  def total
    puts "Всего очков: #{score}"
  end

  def score
    values = []
    @cards.each { |card| values << card.value }
    values[values.index(values.max)] = 1 if values.sum > 21 && values.max == 11
    values.sum
  end

  def show_cards
    puts "Карты #{@name}:"
    player.cards.each { |card| puts "Карта: #{card}. Очков: #{card.value}" }
  end

  private

  def validate!
    raise 'Name cannot be empty string.' if @name.empty?
  end
end
