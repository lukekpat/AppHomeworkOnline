class Map 

  def initialize
    @map = []
  end

  def set(key, value)
    # Take in 2 variables 
    # Make an array of [var1, var2]
    # Shovel that into the map 

    if @map.any?{|pair| pair[0] == key}
      pair[1] = value if 
    else
      @map << [key, value] 
    end
  end

  def get(key)
    #Find out which index of map contains key at pair[0]
    #Return pair[1]

    @map.each do |pair|
      return pair[1] if pair[0] == key
    end
  end

  def delete(key)
    @map.each_with_index do |pair,idx|
      @map = @map[0...idx].concat(@map[idx+1..-1]) if pair[0] == key 
    end
  end

  def show
    # No idea what this is supposed to be, so just printing the map.  

    p @map
  end
end