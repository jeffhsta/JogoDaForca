require_relative "my_ci"
require_relative "word_raffle"

class Game
	attr_reader :raffle_word

	def initialize(ci = MyCI.new, word_raffle = WordRaffle.new)
		@ci = ci
		@word_raffle = word_raffle
		@ended = false
		@raffle_word = nil
	end

	def start
		@ci.write "Welcome to Forca game!"
	end

	def ended?
		@ended
	end

	def next_step
		@ci.write "How the length of word for be raffled?"
		input_text = @ci.read.strip

		run_the_next_step input_text
	end

	private

	def run_the_next_step(input_text)
		if input_text == "finish"
			@ended = true
		else
			word_length = input_text.to_i
			begin
				# raffle_word! word_length
				@raffle_word = @word_raffle.raffle_word word_length
				@ci.write underscore_for_word_length(word_length) 
			rescue StandardError => error
				@ci.write error.message
			end
		end
	end

	def underscore_for_word_length(input_text)
		"_" * input_text
	end
end
