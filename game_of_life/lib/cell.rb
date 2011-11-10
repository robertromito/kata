class Cell

  def initialize
    @alive = true
    @neighbours = 2
  end

  def dead?
    !alive?
  end

  def alive?
    @alive
  end

  def time_passes
    @alive =
      (@alive && @neighbours == 2) ||
      (@alive && @neighbours == 3) ||
      (!@alive && @neighbours == 3)
  end

  def neighbours=(number_of_neighbours)
    @neighbours = number_of_neighbours
  end

  def die
    @alive = false
  end
  
end

