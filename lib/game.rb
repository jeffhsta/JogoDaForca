class Game
	def initialize(output = STDOUT)
		@output = output
		@ended = false
	end

	def start
		@output.puts "Welcome to Forca game!"
	end

	def ended?
		@ended
	end
end