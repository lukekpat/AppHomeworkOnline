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
      self.take_turn
    end
    self.game_over_message
    self.reset_game
  end

  def take_turn
    # Call SHOW_SEQUENCE and REQUIRE_SEQUENCE 
    # When the game is not over, call ROUND_SUCCESS_MESSAGE
    # When the game is not over, increment the sequence length 
    puts "So, you want to challenge Simon?"
    puts "You're not the first."
    puts "Watch Simon's Sequence... Closely..."
    sleep(3)
    self.show_sequence

    puts "Now, your turn!"
    self.require_sequence
    if @game_over == false 
      self.round_success_message
      @sequence_length += 1 
    end
  end

  def show_sequence
    # Call ADD_RANDOM_COLOR
    self.add_random_color
    seq.each do |color|
      puts color
      sleep(1)
      system("clear")
    end
  end

  def require_sequence
    user_seq_idx = 0
    until user_seq_idx == @sequence_length || @game_over == true 
      puts "\nEnter Simon's Sequence, one color at a time:\n"
      user_color = gets.chomp
      if user_color != @seq[user_seq_idx]
        @game_over = true 
      end
      user_seq_idx += 1 
    end
    return 
  end

  def add_random_color
    # Adds one random color from COLORS constant to the sequence
    seq << COLORS.sample
  end

  def round_success_message
    puts "\nSimon Says: Good job, cowboy!\nYou won that round!\nThe next won't be easy...\n"
  end

  def game_over_message
    puts "\nWRONG!\nGuess you couldn't keep up! Sucks to be you!\n"
  end

  def reset_game
    # Set the sequence length to 1 
    # Set "Game Over" to false 
    # Set the sequence to an empty array 

    @sequence_length = 1 
    @game_over = false 
    @seq = [] 
  end
end
