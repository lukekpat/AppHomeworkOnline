class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    # Initialize starts the sequence length at 1 
    # Starts "Game Over" as false 
    # Starts the sequence as an empty array 
    
    @sequence_length = 1 
    @seq = [] 
    @game_over = false

  end

  def play
    # Call TAKE_TURN 
    # Call TAKE_TURN until the game is over 
    # Call the GAME_OVER_MESSAGE and RESET_GAME if game is over 

    until @game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    # Call SHOW_SEQUENCE and REQUIRE_SEQUENCE 
    # When the game is not over, call ROUND_SUCCESS_MESSAGE
    # When the game is not over, increment the sequence length 

  end

  def show_sequence
    # Call ADD_RANDOM_COLOR
  end

  def require_sequence
    user_seq_idx = 0
    until user_seq_idx == sequence_length || @game_over = true 
      puts "Enter Simon's Sequence, one color at a time:\n"
      user_color = gets.chomp
      if user_color != seq[user_seq_idx]
        @game_over = true 
      end
      user_seq_idx += 1 
    end
    return 
  end

  def add_random_color
    # Adds one random color from COLORS constant to the sequence
  end

  def round_success_message
    puts "Simon Says: Good job, cowboy!\nYou won that round!\nThe next won't be easy..."
  end

  def game_over_message
    puts "WRONG! Guess you couldn't keep up! Sucks to be you!"
  end

  def reset_game
    # Set the sequence length to 1 
    # Set "Game Over" to false 
    # Set the sequence to an empty array 
  end
end
