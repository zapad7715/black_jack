require_relative 'bank'

# frozen_string_literal: true

class Dealer < Hand
  include Bank

  attr_reader :hand

  def initialize
    @hand = Hand.new
  end
end
