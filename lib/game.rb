require_relative "my_ci"

class Game
	attr_reader :raffle_word

	def initialize(ci = MyCI.new)
		@ci = ci
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
		@ended = true

		if input_text == "finish"
			@ended = true
		else
			words = %w(hi mom game fruit)
			@raffle_word = words.detect do |word|
				word.length == input_text.to_i
			end
			@ci.write underscore_for_word_length(input_text) 
		end
	end

	private

	def underscore_for_word_length(input_text)
		"_" * input_text.to_i
	end
end