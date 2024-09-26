# frozen_string_literal: true

# Computer class for computer as player
class Computer < Player
  def input_code(board, balls)
    board.secret_code = balls.colors.sample(4)
    pp board.secret_code
  end
end
