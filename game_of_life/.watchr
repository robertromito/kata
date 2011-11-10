def run_specs
  puts "Running specs..."
  system "rspec spec"
end

puts "Greetings. I'll run all specs whenever you save a source file."

watch('spec/(.*)\.rb') {|md| run_specs}
watch('lib/(.*)\.rb') {|md| run_specs}
