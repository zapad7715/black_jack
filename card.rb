# frozen_string_literal: true

class Card
  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def value
    return 10 if %w[J Q K].include?(@value)
    return 11 if ['A'].include?(@value)
    @value
  end

  def to_s
    "#{@value}#{@suit}"
  end
end
