require "spec_helper"
require "game"

describe Game do
	let(:ci) { double("ci").as_null_object }
	subject(:game) { Game.new ci }

	describe "#start" do
		it "print the initial message" do
			initial_message = "Welcome to Forca game!"
			expect(ci).to receive(:write).with(initial_message)

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

				expect(ci).to receive(:write).with(question)
				# expect(ci).to receive(:read)

				game.next_step
			end

			xit "should print '____' for a word with length is 4" do
				allow(ci).to receive(:read).and_return("4")

				expect(ci).to receive(:write).with("____")

				game.next_step
			end
		end

		xit "finish the game when the player asks to" do
			player_input = "finish"
			allow(ci).to receive(:read).and_return("finish")

			game.next_step

			expect(game).to be_ended
		end
	end
end
