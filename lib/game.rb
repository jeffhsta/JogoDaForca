require_relative "my_ci"
require_relative "word_raffle"
require_relative "word_in_progress"

class Game
	attr_reader :raffle_word

	def initialize(ci = MyCI.new, word_raffle = WordRaffle.new, word_in_progress = WordInProgress.new)
		@ci = ci
		@word_raffle = word_raffle
		@word_in_progress = word_in_progress

		@ended = false
		@raffle_word = nil
		@words_right = []
		@guess_wrong = 0
	end

	def start
		@ci.write "Welcome to Forca game!"
	end

	def ended?
		@ended
	end

	def next_step
		if @raffle_word == nil
			@ci.write "How the length of word for be raffled?"
		end

		input_text = @ci.read.strip
		run_the_next_step input_text
	end

	private

	def run_the_next_step(input_text)
		if input_text == "finish"
			@ended = true
		elsif is_case_for_guess_word? input_text
			guess_a_letter input_text.upcase
		else
			raffle_word_with_word_length input_text
		end

		print_underscore if @raffle_word != nil
		print_doll_draw if @guess_wrong > 0
	end

	def print_doll_draw
		@ci.write @word_in_progress.draw_doll(@guess_wrong)
	end

	def is_case_for_guess_word?(input_text)
		input_text.length == 1 and @raffle_word != nil
	end

	def print_underscore
		@ci.write @word_in_progress.generate_word(@raffle_word, @words_right)
	end

	def guess_a_letter(input_text)
		if @raffle_word.include? input_text
			add_word_in_words_right input_text
		else
			@guess_wrong += 1
		end
	end

	def add_word_in_words_right(word)
		if !@words_right.include? word
			@words_right << word
		end
	end

	def raffle_word_with_word_length(input_text)
		word_length = input_text.to_i
		begin
			@raffle_word = @word_raffle.raffle_word word_length
		rescue StandardError => error
			@ci.write error.message
		end
	end
end
