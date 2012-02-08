class StringCalc

  DEFAULT_DELIMETER = ","
  DELIMETER_OVERRIDE_INDICATOR = "//"
  
  def calculate(operand_string)
    delimeter, operands = parse_operand_string(operand_string)
    validate_operands(operands)
    return operands.inject(0){|sum, i| sum += i.to_i}
  end

  def validate_operands(operands)
    negative_operands = operands.select {|i|i.to_i < 0}
    raise ArgumentError, "negatives not allowed: #{negative_operands.join(",")}" if negative_operands.count > 0
  end

  def parse_operand_string(operand_string)
    return DEFAULT_DELIMETER, operand_string.split(DEFAULT_DELIMETER) unless operand_string.start_with?(DELIMETER_OVERRIDE_INDICATOR)
    delimeter = operand_string[2].chr
    return delimeter, operand_string.partition("\n").last.split(delimeter)
  end
end

describe "String Calculator" do

  before(:each) do
    @calc = StringCalc.new
  end
  
  it "returns zero for an empty string" do
    @calc.calculate("").should eql 0
  end

  it "returns the single operand when given one operand" do
    @calc.calculate("1").should eql 1
  end

  it "returns the sum of the operands when given 2 operands" do
    @calc.calculate("1,2").should eql 3
  end

  it "returns the sum of the operands when given more than 2 operands" do
    @calc.calculate("1,2,3").should eql 6
    @calc.calculate("9,9,9,9,9,9,9").should eql 63
  end

  it "returns the sum of the operands when \n is used as a separator" do
    @calc.calculate("1\n,2,3").should eql 6
  end

  it "supports changing the delimeter" do
    @calc.calculate("//;\n1;2").should eql 3
    @calc.calculate("//*\n10*20*30*40").should eql 100
  end

  it "hurls when given a negative operand" do
    expect { @calc.calculate("-1,1") }.should raise_error(ArgumentError, "negatives not allowed: -1")
  end
  
end    
