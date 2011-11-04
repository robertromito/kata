class FizzBuzz

  def go(count_to)

    output = ""
    
    1.upto(count_to) do |i|
      msg = ""
      msg << "Fizz" if (i % 3) == 0
      msg << "Buzz" if (i % 5) == 0
      msg << i.to_s if msg.empty?
      output << msg << " "
    end

    return output.strip
  end
    
end

require 'rubygems'
require 'rspec'

describe FizzBuzz do

  it "prints 1 for 1" do
    fb = FizzBuzz.new
    fb.go(1).should == "1"
  end

  it "prints 1 2 Fizz for 3" do
    FizzBuzz.new.go(3).should == "1 2 Fizz"
  end

  it "prints 1 2 Fizz 4 Buzz for 5" do
    FizzBuzz.new.go(5).should == "1 2 Fizz 4 Buzz"
  end

  it "print 1 2 Fizz 4 Buzz Fizz 7 8 Fizz Buzz 11 Fizz 13 14 FizzBuzz for 15" do
    FizzBuzz.new.go(15).should == "1 2 Fizz 4 Buzz Fizz 7 8 Fizz Buzz 11 Fizz 13 14 FizzBuzz"
  end

end
