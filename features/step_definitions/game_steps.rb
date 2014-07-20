When /^start a new game$/ do
	run_interactive "forca"
end

Then /^look on screen:$/ do |message|
	steps %{
		* the stdout should contain "#{message}"
	}
end