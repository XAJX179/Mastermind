# frozen_string_literal: true

# Computer class for computer as player
class Computer < Player
  attr_accessor :feedbacks, :count

  def initialize(type)
    super
    @count = []
  end

  def input_code(balls)
    balls.colors.sample(4)
  end

  def guess(board, balls)
    sleep(2)
    code = if first_try?(board)
             input_code(balls)
           else
             use_stored_stats(balls)
           end
    store_feedback(board, code) if Game.valid_guess?(code, balls)
    code
  end

  def first_try?(board)
    board.turns_left == 12
  end

  def store_feedback(board, code)
    feedback = board.feedback(code)
    count.push(counting(feedback))
  end

  def use_stored_stats(balls)
    if count.any?(4)
      shuffle(balls)
    elsif count.any?(3)
      replace_colors(balls, 3, 1)
    elsif count.any?(2)
      replace_colors(balls, 2, 2)
    else
      replace_colors(balls, 1, 3)
    end
  end

  def replace_colors(balls, count_num, num)
    index = count.index(count_num)
    arr = Array.new(balls.board_colors[index])
    cleaned_arr = arr.shuffle!
    cleaned_arr.pop(num)
    value = (balls.colors - cleaned_arr).sample(num)
    cleaned_arr.push(value).flatten
  end

  def counting(feedback)
    sum(feedback.values)
  end

  def sum(arr = [])
    arr.sum
  end

  def shuffle(balls)
    index = count.index(4)
    while (value = balls.board_colors[index].sample(4))
      break unless balls.board_colors.include?(value)
    end
    value
  end
end
