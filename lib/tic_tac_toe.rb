require "pry"

class TicTacToe
  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(place, user = "X" )
    @board[place] = user
  end
  def position_taken?(index)
    @board[index] != " "
  end
  def valid_move?(index)
    @board[index] == " "
  end
  def turn_count
    count = 0
    @board.each do |index|
      if index != " "
        count += 1
      end
    end
    count
  end
  def current_player
    turn_count.even? ? "X" : "O"
  end
  def turn
    puts "Please enter a number between (1-9):"
    input = gets.strip
    index = input_to_index(input)
    binding.pry
    if valid_move?(index)
      token = current_player
      move(index, token)
    else
      turn
    end
    display_board
  end
end
