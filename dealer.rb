# frozen_string_literal: true

require_relative 'bank'
require_relative 'hand'

class Dealer
  include Bank

  attr_reader :hand

  def initialize
    @hand = Hand.new
    class << @hand
      alias_method :real_take_card, :take_card
      def take_card(deck)
        raise 'Dealer pass.' if score >= 19
        real_take_card(deck)
      end
    end
  end
end
