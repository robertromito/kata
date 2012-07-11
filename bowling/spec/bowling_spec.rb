class BowlingGame
  def score
    0
  end
end

describe "Bowling Game" do

  it "sets your initial score to zero" do 
    @game = BowlingGame.new
    @game.score.should eql 0
  end

  #it "scores 0 if you miss all pins for all ten frames"
  
end
