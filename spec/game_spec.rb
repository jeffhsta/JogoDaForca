require "spec_helper"
require "game"

describe Game do
	subject(:output) { double "output" }

	describe "#start" do
		it "print the initial message" do
			initial_message = "Welcome to Forca game!"
			game = Game.new output

			expect(output).to receive(:puts).with(initial_message)

			game.start
		end
	end
end