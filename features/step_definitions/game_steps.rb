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
	type word_size
end

When /^finish the game$/ do
	finish_game
end

Then /^the game finish with the message on the screen:$/ do |message|
	assert_partial_output message, all_stdout
end

Given /^the game is started$/ do
	start_a_new_game
end

Given /^the word length is "(.*?)"$/ do |word_length|
	type word_length
end

When /^I guess letter "(.*?)"$/ do |letter|
	type letter
end
