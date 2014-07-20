class Game
	def initialize(output = STDOUT)
		@output = output
	end

	def start
		@output.puts "Welcome to Forca game!"
	end
end