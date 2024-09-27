# frozen_string_literal: true

# Player class for things all players's common things.
class Player
  attr_reader :type

  def initialize(type)
    @type = type
  end
end
