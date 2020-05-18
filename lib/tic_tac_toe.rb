class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
  
  def initialize
    @board = Array.new(9, " ")
  end
  
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(position)
    position.to_i - 1
  end
  
  def move(position, current_player = "X")
    index_position = input_to_index(position)
    @board[position] = current_player
  end
  
  def position_taken?(position)
    @board[position] != " " ? true : false
  end
  
  def valid_move?(position)
    position_taken?(position) ? false : position.between?(0, 8) ? true : false
  end
  
  def turn
    puts "Please select a position between 1-9."
    input = gets.strip
    input = input.to_i
    if valid_move?(input)
      move(input)
    else
      turn
    end
    display_board
  end
  
  def turn_count
    @board.count("X") + @board.count("O")
  end
  
  def current_player
    (@board.count("X") + @board.count("O"))%2 == 0 ? "X" : "O"
  end
  
  def winner
    winning_row = won?
      if !won? 
        false
      else
        @board[winning_row[0]]
      end
  end
  
  def won?
    WIN_COMBINATIONS.each do |row|
      if @board[row[0]] == @board[row[1]] && @board[row[0]] == @board[row[2]]
        return row
      end
    end
    return false
  end
  
  def full?
    @board.find(" ") ? false : true
  end
  
  
  def draw?
    !over? ? false : won? ? false : true
  end
  
  def over?
    won? || draw? 
  end
  
  def play 
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
    
  end
        
  
    
    
  















end