class BowlingGame

  def initialize
    @score = 0
  end
  
  def score
    @score
  end

  def number_of_frames
    10
  end

  def frame_results(first_roll, second_roll)
    pins = first_roll + second_roll

    raise "You cannot knock down more than 10 pins in one frame, you cheater!" if pins > 10

    @score += pins
  end
  
end

describe "Bowling Game" do

  before :each do 
    @game = BowlingGame.new
  end
  
  it "sets your initial score to zero" do 
    @game.score.should eql 0
  end

  it "has 10 frames per game" do 
    @game.number_of_frames.should eql 10
  end

  it "does not allow you to knock down more than 10 pins for a frame" do
    err_msg = "You cannot knock down more than 10 pins in one frame, you cheater!"

    [[8,6], [2,10], [10,10], [5,9]].each do |pins|
      lambda{@game.frame_results *pins}.should raise_error err_msg
    end
    
  end 

  describe "first frame" do 

    it "keeps your score at zero if you miss all pins" do 
      @game.frame_results 0, 0
      @game.score.should eql 0
    end

    it "adds the number of pins you hit to your score if you don't knock down all pins" do 
      @game.frame_results 6, 3
      @game.score.should eql 9
    end

  end

  #it "scores 0 if you miss all pins for all ten frames"
  
end
