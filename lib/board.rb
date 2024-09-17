# frozen_string_literal: true

# Board for game board to display
class Board
  def initialize(balls)
    welcome
    print_board(balls)
  end

  def welcome
    puts 'Start!'
    puts 'Mastermind!'
  end

  def print_board(balls)
    balls.board_colors.each do |array|
      line = array.map do |item|
        '⚈ '.colorize(item)
      end
      puts "\t\t" + line.join
    end
  end
end
