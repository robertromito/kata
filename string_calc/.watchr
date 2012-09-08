require 'rubygems'
require 'ruby_gntp'

def run_specs(file)
  puts "Running nodeunit specs..."
  result = `node #{file}`
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

puts "Greetings. I'll run all specs whenever you save a source file."
initialize_growl

watch('(.*)\.js') {|md| run_specs(md)}
