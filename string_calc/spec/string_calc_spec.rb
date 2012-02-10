class StringCalc

  DELIMITER = ','
  
  def self.string_calc(operands_string)
    operands = normalize_delimiter_in_operands(operands_string)
    return  operands.split(DELIMITER).inject(0){|sum, i| sum += i.to_i }
  end

  def self.normalize_delimiter_in_operands(operands)
    alt_delimiter = ["\n"]

    operands.gsub(/^\/\/(.)\n/, '')
    alt_delimiter << $1 unless $1.nil?
    
    alt_delimiter.each {|d| operands.gsub!(d, DELIMITER) }
    return operands
  end

end

describe "StringCalculator" do  

  it "returns zero when given and empty string" do 
    StringCalc.string_calc("").should eql 0
  end

  it "returns operand when passed a single operand" do 
    StringCalc.string_calc("3").should eql 3
    StringCalc.string_calc("100").should eql 100
    StringCalc.string_calc("0").should eql 0
  end

  it "returns sum of two numbers when passed a string delimited with a comma" do
    StringCalc.string_calc("3,4").should eql 7
    StringCalc.string_calc("100,100").should eql 200
  end

  it "returns the sum of any number of operands" do
    StringCalc.string_calc("1,2,3,4,5").should eql 15
    StringCalc.string_calc("20,20,20,20,20,20").should eql 120
  end

  it "returns the sum of numbers when given a string delimited with either a comma and/or newline" do
    StringCalc.string_calc("1\n2,3,4\n5").should eql 15
  end

  it "returns the sum of numbers when given a string with a defined delimiter" do
    StringCalc.string_calc("//;\n1;2;3").should eql 6
    StringCalc.string_calc("//;\n1;2;3\n4,5;6").should eql 21
  end
  
end
