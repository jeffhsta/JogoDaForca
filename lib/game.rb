class Game
	def initialize(output = STDOUT, input = STDIN)
		@output = output
		@input = input
		@ended = false
	end

	def start
		@output.puts "Welcome to Forca game!"
	end

	def ended?
		@ended
	end

	def next_step
		@output.puts "How the length of word for be raffled?"
		@input.gets
	end
end