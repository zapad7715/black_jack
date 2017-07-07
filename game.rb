# frozen_string_literal: true

class Game
  def initialize
    @dealer = Dealer.new
    @user = create_user
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

  def hide_cards(player)
    puts "Карты #{player.name}:"
    @cards.each { puts 'Карта: *. Очков: *' }
  end

  def reset_deck
    @deck = Deck.new
  end

  def show_cards(*players)
    players.each do |player|
      puts "Карты #{player.name}:"
      player.cards.each { |card| puts "Карта: #{card}. Очков: #{card.value}" }
      total(player)
    end
  end

  def total(player)
    puts "Всего очков: #{player.score}"
  end
end
