# frozen_string_literal: true

# Game functions
module Game
  TOTAL_TURNS = 12
  def self.start
    human = Human.new('guesser')
    computer = Computer.new('mastermind')
    balls = Balls.new
    board = Board.new(balls)
    run_game(human, computer, board, balls)
  end

  def self.game_loop(human, computer, board, balls)
    choose_code(human, computer, board, balls) if board.secret_code.empty?
    guess_code(human, computer, board, balls) if board.turns_left.positive?
    check_guess(board, balls)
  end

  def self.run_game(human, computer, board, balls)
    loop do
      game_loop(human, computer, board, balls)
      if board.winner != 'none'
        winner_announce(board)
        break
      end
    end
  end

  def self.choose_code(human, computer, board, balls)
    code = if computer.type == 'mastermind'
             computer.input_code(board, balls)
           else
             human.input_code(board, balls)
           end
    board.secret_code.push(code).flatten!
    puts 'Secret Code Selected!'
    pp board
  end

  def self.guess_code(human, computer, board, balls)
    puts 'Guess Code :'
    code = guesser_choose(human, computer, board, balls)
    if valid_guess?(code, balls)
      update_colors(code, board, balls)
      board.print_board(balls)
    else
      puts 'Invalid Guess. Try again.'
    end
  end

  def self.guesser_choose(human, computer, board, balls)
    if computer.type == 'guesser'
      computer.guess(board, balls)
    else
      human.guess(board, balls)
    end
  end

  def self.valid_guess?(code, balls)
    !balls.board_colors.include?(code)
  end

  def self.update_colors(code, board, balls)
    index = TOTAL_TURNS - board.turns_left
    balls.board_colors[index] = code
    board.turns_left -= 1
  end

  def self.check_guess(board, balls)
    if balls.board_colors.include?(board.secret_code)
      board.winner = 'guesser'
    else
    end
  end

  def self.winner_announce(board)
    if board.winner == 'guesser'
      puts 'Guesser Wins!'
    else
      puts 'Mastermind Wins!'
    end
  end
end
