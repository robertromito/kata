SUPPORTED_DELIMETERS = /(,|\n)/

def calc(args)
  operands = extract_operands_from args
  return operands[0].to_i if operands.size == 1
  return sum_of_operands(operands)
end

def extract_operands_from(args)
  args.split SUPPORTED_DELIMETERS
end

def sum_of_operands(operands)
  operands.inject(0) {|sum, o| sum += o.to_i}
end


describe "String Calculator" do 

  it "returns 0 when given an empty string" do
    calc("").should eql 0 
  end

  it "returns the operand when given only one operand" do 
    calc("1").should eql 1
    calc("99").should eql 99
    calc("24564327").should eql 24564327
  end
  
  it "returns the sum of the operands when given 2 operands" do 
    calc("1,2").should eql 3
    calc("100,100").should eql 200
  end

  it "returns the sume of the operands when given N operands" do 
    calc("1,2,3,4").should eql 10
    calc("10,10,10,10,10,10,10,10,10,11").should eql 101
  end

  it 'supports using \n as an additional delimiter' do 
    calc("1\n2,3").should eql 6
  end
end
