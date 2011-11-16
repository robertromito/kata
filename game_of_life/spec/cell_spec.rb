require 'rspec'
require 'cell'
 
describe Cell do
  
  before do
    @cell = Cell.new 
  end

  describe "currently living" do

    it "should look alive" do
      @cell.should_not be_alive
    end

    it "should not be alive & dead at the same time" do
      @cell.alive?.should_not == @cell.dead?
    end

    def cell_dies_surrounded_by (number_of_neighbours)
      @cell.neighbours = number_of_neighbours
      @cell.time_passes
      @cell.should be_dead
    end

    def cell_lives_surrounded_by(number_of_neighbours)
      @cell.neighbours = number_of_neighbours
      @cell.time_passes
      @cell.should be_alive
    end

    it "starves with too few neighbours" do
      cell_dies_surrounded_by 0
      cell_dies_surrounded_by 1
    end

    it "is crowded out with too many neighbours" do
      cell_dies_surrounded_by 4
      cell_dies_surrounded_by 5
      cell_dies_surrounded_by 6
      cell_dies_surrounded_by 7
      cell_dies_surrounded_by 8
    end

    it "survives with the right amount of neighbours" do
      cell_lives_surrounded_by 2
      cell_lives_surrounded_by 3
    end
    
  end

  describe "taking a dirt nap" do

    before do
      @cell.die
    end

    it "should be dead" do
      @cell.should be_dead
    end

    it "should remain dead with 2 neighbours" do
      @cell.neighbours = 2
      @cell.time_passes
      @cell.should be_dead
    end

    it "should be born with 3 neighbours" do
      @cell.neighbours = 3
      @cell.time_passes
      @cell.should be_alive
    end

    it "should remain dead with 4 neighbours" do
      @cell.neighbours = 4
      @cell.time_passes
      @cell.should be_dead
    end

    it "should remain dead with 8 neighbours" do
      @cell.neighbours = 8
      @cell.time_passes
      @cell.should be_dead
    end
    
  end
end
