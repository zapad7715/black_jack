# frozen_string_literal: true

require_relative 'bank'

class Dealer
  include Bank

  attr_reader :hand

  def initialize
    @hand = Hand.new
    class << @hand
      alias_method :real_take_card, :take_card
      def take_card(deck)
        # In life there must be a place for the occasion
        raise 'Dealer pass.' if score >= 19 && (0..91).cover?(rand(100))
        real_take_card(deck)
      end
    end
  end
end
