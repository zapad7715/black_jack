# frozen_string_literal: true

module Show
  def greeting(player)
    line
    puts "#{player.name} добро пожаловать в игру Blackjack!"
    line
  end

  def hide_cards(player)
    puts "Карты #{player.name}:"
    player.cards.each { puts 'Карта: *. Очков: *' }
    line
  end
  
  def start_menu(player)
    puts "Ваш банк составляет #{player.bank} долларов. Ставка за раунд 10 долларов."
    puts 'Начать новый кон? y/n?'
    line
  end

  def line
    puts '========================================================================='
  end

  def show_actions(player)
    puts '1 – Пропустить.'
    puts '2 – Добавить карту.' if player.cards.size == 2
    puts '3 – Открыть карты.'
    line
  end

  def show_cards(player)
    puts "Карты #{player.name}:"
    player.cards.each { |card| puts "Карта: #{card}. Очков: #{card.value}" }
    total(player)
    line
  end

  def total(player)
    puts "Всего очков: #{player.score}"
  end
end
