# frozen_string_literal: true

# Game functions
module Game
  def self.start
    human = Human.new
    computer = Computer.new
    balls = Balls.new
    board = Board.new(balls)
    run_game(human, computer, board, balls)
  end

  def self.run_game(human, computer, board, balls)
    nil
  end
end
