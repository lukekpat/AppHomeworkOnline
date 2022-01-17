require_relative 'board'
require_relative 'player'

class Mancala
  def initialize(name1, name2) #Take in both players' names 
    @player1 = Player.new(name1, 1)
    # Make a player instance out of player 1's name and give them Row 1 (1-6)
    @player2 = Player.new(name2, 2)
    # Make a player instance out of player 2's name and give them Row 2 (7-12)
    @board = Board.new(name1, name2)
    # Make a board instance with both players' names 
  end

  def play
    puts "Welcome to Mancala"
    # Print welcome message 
    @board.render
    # board.render --> render the board 
    current_player = @player1
    # create @current_player, set it to player1
    until won?
      #Until Loop --> Until somebody wins
      take_turn(current_player)
      # take_turn(current_player)
      current_player = current_player == @player1 ? @player2 : @player1
      # I don't know what this means.  I think it changes current player at the end of a turn.  
    end

    puts "The game is finished! #{winner_message}"
    # When someone wins, print that someone won. 
  end

  def take_turn(current_player)
    # Take in the current_player 
    move_result = :prompt
    # set move_result to :prompt

    until move_result == :switch
      #Until Loop --> Until move_result becomes :switch 
      if move_result == :prompt
        #Check to see if move_result is :prompt 
        print_indices
        #If it is, print_indices 

        begin 
          start_pos = current_player.prompt
          start_pos -= 1 if start_pos <= 6
          @board.valid_move?(start_pos)
        rescue Exception => e
          puts e.message
        retry
        end
        move_result = @board.make_move(start_pos, current_player.name)
      else
        move_result = @board.make_move(move_result, current_player.name)
      end
      break if won?
    end
  end

  def won?
     @board.one_side_empty?
  end

  def winner_message
    winner = @board.winner
    if winner == :draw
      "It was a draw!"
    else
      "Congrats, #{winner}!"
    end
  end

  def print_indices
    puts "\nCup indices:"
    puts "12  11  10   9   8   7"
    puts " 1   2   3   4   5   6"
  end
end
