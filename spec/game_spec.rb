require "spec_helper"
require "game"

describe Game do
	subject(:output) { double "output" }
	subject(:game) { Game.new output }

	describe "#start" do
		it "print the initial message" do
			initial_message = "Welcome to Forca game!"
			expect(output).to receive(:puts).with(initial_message)

			game.start
		end

		it "read the number of letter for to raffle a word" do
		end
	end

	describe "#ended?" do
		it "return false when game just started" do
			expect(game).not_to be_ended
		end
	end

	describe "#next_step" do
		context "when the game just started" do
			it "asks the playes for the length of the word to be raffled" do
				question = "How the length of word for be raffled?"

				expect(output).to receive(:puts).with(question)

				game.next_step
			end
		end
	end
end
