require 'ruby-dictionary'
require 'pry'

class WordChain
	attr_accessor :dictionary, :start_word, :final_word, :final_chain, :index
    def initialize(dictionary)
        @dictionary = dictionary
    end

    def find_chain(start_word, final_word)
    	@start_word = start_word
    	@final_word = final_word
    	@final_chain = [@start_word]
    	@index=0
    	compare
    	@final_chain
    end

    def compare
    	if @start_word[index]==@final_word[index]
    		move_letter
    	else
    		change_letter
    	end
    end

    def change_letter
    	@start_word[index]=@final_word[index]
    	check_dictionary(@start_word)
    end

    def move_letter
    	binding.pry

    	@index = @index+1
    	compare	
    end

    def check_dictionary(word_to_check)
    	if dictionary.exists?(word_to_check)
    		add_to_chain(word_to_check)
    	else
    		move_letter
    	end

    end

    def add_to_chain(word_to_add)
    	@final_chain.push(word_to_add)
    end


end

dictionary = Dictionary.from_file("/usr/share/dict/words")
my_chain = WordChain.new(dictionary)
my_chain.find_chain("cat", "dog")

