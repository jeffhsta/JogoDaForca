class Game
	def initialize(ci = MyCI.new)
		@ci = ci
		@ended = false
	end

	def start
		@ci.write "Welcome to Forca game!"
	end

	def ended?
		@ended
	end

	def next_step
		@ci.write "How the length of word for be raffled?"
		input_text = @ci.read

		if input_text == "finish"
			@ended = true
		else
			@ci.write underscore_for_word_length(input_text)
		end
	end

	private

	def underscore_for_word_length(input_text)
		"_" * input_text.to_i
	end
end