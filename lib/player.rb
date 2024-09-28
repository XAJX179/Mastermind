# frozen_string_literal: true

# Player class for things all players's common things.
class Player
  attr_reader :type

  def initialize(type)
    @type = type
  end

  def self.select_type
    puts 'Select your role : g = guesser or m = mastermind'
    input = gets.chomp.match(/[gm]{1}/).to_s
    case input
    when 'g'
      %w[guesser mastermind]
    when 'm'
      %w[mastermind guesser]
    end
  end
end
