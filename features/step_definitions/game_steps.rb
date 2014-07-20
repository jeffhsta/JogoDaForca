When /^start a new game$/ do
	run_interactive "forca"
end

Then /^look on screen:$/ do |message|
	assert_partial_output message, all_stdout
end