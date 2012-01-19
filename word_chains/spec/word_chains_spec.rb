require '../lib/word_chains'

def compare_words(words)
    words.each_with_index do |item, index|
      word = item
      next_word = words[index + 1]
      (word.to_a - next_word.to_a).size.should == 1
    end
end

describe WordChains do

  before :each do
    @wc = WordChains.new "wordlist.txt"
  end

  it "outputs start and end when they are the same" do
    @wc.do_chain("dog", "dog").should eql ["dog", "dog"]
    @wc.do_chain("cat", "cat").should eql ["cat", "cat"]
    @wc.do_chain("ben", "ben").should eql ["ben", "ben"]
  end

  it "makes sure each word differs from previous word by one letter only" do
    compare_words @wc.do_chain("dog", "dom")
    compare_words @wc.do_chain("cat", "toe")
    compare_words @wc.do_chain("ball", "frog")
    compare_words @wc.do_chain("big", "bog")
    compare_words @wc.do_chain("tax", "the")
  end

  it "makes sure the first word is the start word" do
    @wc.do_chain("dog", "dom").first.should == "dog"
  end

  it "makes sure the last word is the end word" do
    @wc.do_chain("dog", "dom").last.should == "dom"
  end
  
end
