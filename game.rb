# frozen_string_literal: true

class Game
  def initialize
    @dealer = Dealer.new
    @player = create_user
    @deck = Deck.new
    distribution(@deck)
  end

  private

  def create_user
    puts 'Введите ваше имя: '
    User.new(gets.chomp)
  rescue RuntimeError => e
    puts e.message
    retry
  end

  def distribution(deck)
    2.times { @player.take_card(deck) }
    2.times { @dealer.take_card(deck) }
  end

  def reset_deck
    @deck = Deck.new
  end

end
