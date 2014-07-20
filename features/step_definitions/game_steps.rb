When /^start a new game$/ do
	game = Game.new
	game.start
end

Then /^look on screen:$/ do |string|
	#
end