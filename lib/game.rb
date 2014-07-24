require_relative "my_ci"
require_relative "word_raffle"

class Game
	attr_reader :raffle_word

	def initialize(ci = MyCI.new, word_raffle = WordRaffle.new)
		@ci = ci
		@word_raffle = word_raffle

		@ended = false
		@raffle_word = nil
		@words_right = []
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
		elsif input_text.length == 1 and @raffle_word != nil
			guess_a_letter input_text.upcase
			print_underscore
		else
			raffle_word_print_underscore input_text
		end
	end

	def print_underscore
		word_in_progress = ""

		@raffle_word.split("").each do |letter|
			word_in_progress << get_letter_for_word_in_progress(letter)
		end

		@ci.write word_in_progress
	end

	def get_letter_for_word_in_progress(letter)
		@words_right.include?(letter) ? letter : "_"
	end

	def guess_a_letter(input_text)
		if @raffle_word.include? input_text
			if !@words_right.include? input_text
				@words_right << input_text
			end
		end
	end

	def raffle_word_print_underscore(input_text)
		word_length = input_text.to_i
		begin
			@raffle_word = @word_raffle.raffle_word word_length
			@ci.write underscore_for_word_length(word_length)
		rescue StandardError => error
			@ci.write error.message
		end
	end

	def underscore_for_word_length(input_text)
		"_" * input_text
	end
end
