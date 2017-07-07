require_relative 'bank'

# frozen_string_literal: true

class Player
  include Bank

  attr_reader :name, :hand

  def initialize(name)
    @name = name
    @hand = Hand.new
    @bank = 100
    validate!
  end

  private

  def validate!
    raise 'Name cannot be empty string.' if @name.empty?
  end
end
