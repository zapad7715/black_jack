class Player

  attr_reader :name, :hand

  def initialize(name)
    @name = name
    @hand = Hand.new
  end
end
