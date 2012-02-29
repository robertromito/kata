def sum_multiples_below(below)
  1.upto(below - 1).inject(0) {|sum, i| is_interesting(i) ? sum + i : sum}
end

def is_interesting(number)
  [3,5].any?{|j| number % j == 0}
end

describe "Natual multiples of 3 or 5" do

  it "returns zero if the below number is less than 3" do 
    sum_multiples_below(1).should eql 0
    sum_multiples_below(2).should eql 0
  end

  it "returns 3 if the below number is 3" do 
    sum_multiples_below(4).should eql 3
  end

  it "returns the sum of multiple of 3 or 5" do
    sum_multiples_below(5).should eql 3
    sum_multiples_below(6).should eql 8
    sum_multiples_below(16).should eql 60
    sum_multiples_below(50).should eql 543
    sum_multiples_below(1000).should eql 233168
  end
  
end
