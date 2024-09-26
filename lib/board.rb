# frozen_string_literal: true

# Board for game board to display
class Board
  attr_accessor :secret_code
  attr_reader :winner

  def initialize(balls)
    @secret_code = []
    @winner = 'none'
    @turns_left = 12
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
      puts "\t\t#{line.join}"
    end
    balls.print_colors
  end
end
