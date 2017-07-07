# frozen_string_literal: true

module Bank
  def give_money!(amount)
    raise 'Not enouch money' if @bank < amount
    @bank -= amount
  end

  def take_money(amount)
    @bank += amount
  end
end
