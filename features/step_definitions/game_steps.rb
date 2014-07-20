When /^start a new game$/ do
	steps %{
		* I run `forca` interactively
	}
end

Then /^look on screen:$/ do |string|
	#
end