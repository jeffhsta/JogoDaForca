When /^start a new game$/ do
	start_a_new_game
end

Then /^I look on screen:$/ do |text|
	assert_partial_output text, all_stdout
end

Given /^I started the game$/ do
	start_a_new_game
end

When /^I choose the raffle word to have "(.*?)" letters$/ do |word_size|
	# type word_size # WORKING
end
