# frozen_string_literal: true

# a human player from Player class
class Human < Player
  def input_code(balls)
    code = []
    get_code(code) until code.length == 4
    format(code, balls)
  end

  def get_code(code)
    puts "color number #{code.length + 1} : "
    input = gets.chomp.match(/[rbycwgm]{1}/).to_s # regex
    if input.empty? || code.include?(input)
      puts 'Invalid input. Try again.'
    else
      code.push(input)
    end
  end

  # converting y to :yellow ,r to :red ,etc
  def format(code, balls)
    code.map! do |color|
      color_index = balls.colors.index { |e| e[0] == color }
      balls.colors[color_index]
    end
  end

  def guess(balls)
    code = []
    get_code(code) until code.length == 4
    format(code, balls)
  end
end
