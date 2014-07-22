module GameHelpers
	def start_a_new_game
		run_interactive "forca"
	end

	def finish_game
		type "finish"
	end
end

World(GameHelpers)
