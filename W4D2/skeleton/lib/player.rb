class Player
  attr_reader :name, :side
  # Return user's name 
  # Return user's side of the board 

  def initialize(name, side)
    @name = name # Take in User's name 
    @side = side # Take in User's side of the Mancala board 
  end

  def prompt
    puts "#{@name}, please enter which cup you would like to start from: "
    # Ask user for cup to start with. 
    start_pos = gets.chomp.to_i
    # Set start_pos to the cup number they give 
    if (start_pos.between?(1,6) && @side != 1 ||
      # check to see if starting position is between 1 & 6 AND is on the row with cups 1-6 
        start_pos.between?(7,12) && @side != 2)
      # check to see if starting position between 7 and 12 AND is on the row with those cups
      raise "Not your side!"
      # if it is not on their side, raise "Not your side!"
    else
      start_pos
      # if it is on their side, return the cup number 
    end
  end
end
