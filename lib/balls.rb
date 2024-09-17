# frozen_string_literal: true

# Balls class for balls on the board.
class Balls
  attr_reader :board_colors

  def initialize
    @board_colors = Array.new(12, %i[white yellow blue red])
  end
end
