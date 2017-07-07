# frozen_string_literal: true

module Show
  def hide_cards(player)
    puts "Карты #{player.name}:"
    @cards.each { puts 'Карта: *. Очков: *' }
  end

  def show_actions(player)
    puts '1 – Пропустить.'
    puts '2 – Добавить карту.' if player.cards.size == 2
    puts '3 – Открыть карты.'
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
