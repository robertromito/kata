require 'rubygems'
require 'ruby_gntp'

def run_rake
  puts "Running rake..."
  result = `cd koans && rake`
  result.split("\n").each do |msg|
    puts msg
  end
    
  growl result
end

def initialize_growl
  @growl = GNTP.new "Watchr"
  @growl.register({:notifications => [{:name => "Watchr", :enabled => true}]})
end

def growl(msg)
  @growl.notify({
                  :name => "Watchr",
                  :title => "Test Results",
                  :text => msg
                })
end

puts "Greetings. I'll run rake whenever you save a source file."
initialize_growl

watch('koans/(.*)\.rb') {|md| run_rake}

