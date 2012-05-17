class PrimeFactors

  def generate(num)
    factors = []

    if num > 1
      while (is_even? num)
        factors << 2
        num  /= 2
      end
      factors << num if num > 1
    end
    
    return factors
  end

  private
  
  def is_even?(num)
    num % 2 == 0
  end
end


describe "PrimeFactors" do 

  before(:each) do 
    @pf = PrimeFactors.new
  end
  
  it "returns an empty set for 1" do 
    @pf.generate(1).should eql []
  end

  it "returns [2] for 2" do 
    @pf.generate(2).should eql [2]
  end

  it "returns [3] for 3" do 
    @pf.generate(3).should eql [3]
  end

  it "returns [2,2] for 4" do 
    @pf.generate(4).should eql [2,2]
  end

  it "returns [2,3] for 6" do
    @pf.generate(6).should eql [2,3]
  end

  it "returns [2,2,2] for 8" do 
    @pf.generate(8).should eql [2,2,2]
  end

  it "returns [3,3] for 9" do 
    @pf.generate(9).should eq [3,3]
  end
  
end
