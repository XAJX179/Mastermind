# frozen_string_literal: true

# Computer class for computer as player
class Computer < Player
  def input_code(board, balls)
    balls.colors.sample(4)
  end

  def guess(board, balls)
    puts ''
  end
end
