# frozen_string_literal: true

# Balls class for balls on the board.
class Balls
  attr_accessor :board_colors
  attr_reader :colors

  def initialize
    @board_colors = Array.new(12, %i[black black black black])
    @colors = %i[yellow blue red cyan white green magenta]
  end

  def print_colors
    line = @colors.map do |color|
      "#{color[0]} = ⚈ ".colorize(color)
    end
    puts "Colors: #{line.join}"
  end
end
