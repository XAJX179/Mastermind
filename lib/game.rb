# frozen_string_literal: true

# Game functions
module Game
  def self.start
    human = Computer.new('guesser')
    computer = Human.new('mastermind')
    balls = Balls.new
    board = Board.new(balls)
    run_game(human, computer, board, balls)
  end

  def self.input_message
    puts 'Enter Code :'
  end

  def self.game_loop(human, computer, board, balls)
    input_message
    choose_code(human, computer, board, balls) if board.secret_code.empty?
    guess_code(human, computer, board, balls)
  end

  def self.run_game(human, computer, board, balls)
    loop do
      game_loop(human, computer, board, balls)
      break if board.winner != 'none'
    end
  end

  def self.choose_code(human, computer, board, balls)
    if computer.type == 'mastermind'
      computer.input_code(board, balls)
    else
      human.input_code(board, balls)
    end
  end

  def self.guess_code(human, computer, board, balls)
    if computer.type == 'guesser'
      computer.guess(board, balls)
    else
      human.guess(board, balls)
    end
  end
end
