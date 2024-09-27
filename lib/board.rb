# frozen_string_literal: true

# Board for game board to display
class Board
  attr_accessor :secret_code, :turns_left, :winner

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
      puts "\t\t#{line.join} #{feedback(array)}"
    end
    balls.print_colors
  end

  def feedback(array)
    array.each_with_object(Hash.new(0)) do |item, obj|
      index = array.index(item)
      if secret_code.include?(item) && secret_code[index] == item
        obj[:right_pos] += 1
      elsif secret_code.include?(item)
        obj[:wrong_pos] += 1
      end
    end
  end
end
