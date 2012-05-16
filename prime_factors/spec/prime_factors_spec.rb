def prime_factors_of(num)
  factors = []
  if num > 1
    if num % 2 == 0
      factors << 2
      num /= 2
    end
  end
  factors << num if num > 1
  return factors
end

describe "Prime Factors" do 
  it "returns an empty set for 1" do 
    prime_factors_of(1).should eql []
  end
  
  it "returns a set containing the given number if it is prime" do 
    prime_factors_of(2).should eql [2]
    prime_factors_of(3).should eql [3]
    prime_factors_of(5).should eql [5]
  end

  it "returns a set containing 2 for 4" do 
    prime_factors_of(4).should eql [2, 2]
  end

  it "returns a set containing 2, 3 for 6" do 
    prime_factors_of(6).should eql [2,3] 
  end

  it "returns a set containing 2,2,2 for 8" do 
    prime_factors_of(8).should eql [2,2,2]
  end
end
