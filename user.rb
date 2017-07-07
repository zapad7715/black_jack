# frozen_string_literal: true

class User < Player
  attr_reader :name

  def initialize(name)
    @name = name
    validate!
    super()
  end

  private

  def validate!
    raise 'Name cannot be empty string.' if @name.empty?
  end
end
