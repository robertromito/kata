class WordChains

  def initialize(words_file_name)
    read_words(words_file_name)
  end
  
  def do_chain(start_word, end_word)
    return [start_word, end_word] if start_word == end_word
    return build_chain start_word, end_word
  end

  private

  def read_words(words_file_name)
    @words = []
    File.open(words_file_name) do |f|
      f.each do |word|
        @words << word.chomp
      end
    end
  end

  def build_chain(start_word, end_word)
    current_word = start_word
    chain = [current_word]
    next_word = nil
    until next_word == end_word
      puts "Getting next for #{current_word}"
      next_word = get_word_after current_word
      chain << next_word
      current_word = next_word
    end
    return chain
  end

  def get_word_after(word)
    word_size = word.size
    word_index = @words.index(word)

    raise "Word #{word} not found in word list" unless word_index

    next_index = word_index + 1
    next_word = @words[next_index]
    until next_word.size == word_size
      next_index += 1
      next_word = @words[next_index]
    end

    return next_word
  end
    
end
