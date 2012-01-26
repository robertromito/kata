class FizzBuzz

  def play(up_to)

    output = ""
    
    1.upto(up_to) do |i|

       if (i % 3 == 0)
         output += "FIZZ "
       elsif (i % 5 == 0)
         output += "BUZZ "
       else
         output += "#{i} "
       end
    end

    return output.chop
    
  end
  
end


describe FizzBuzz do

  before(:each) do
    @fizzbuzz = FizzBuzz.new
  end
  
  it "prints fizz if number is divisible by 3" do
    @fizzbuzz.play(3).should eql "1 2 FIZZ"
  end

  it "prints buzz if number is divisible by 5" do
    @fizzbuzz.play(5).should eql "1 2 FIZZ 4 BUZZ"
  end

end


