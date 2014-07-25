require "spec_helper"
require "game"

describe Game do
	let(:ci) { double("ci").as_null_object }
	let(:word_raffle) { double("word_raffle").as_null_object }
	let(:word_in_progress) { double("word_in_progress").as_null_object }

	subject(:game) { Game.new ci, word_raffle, word_in_progress }

	describe "#start" do
		it "print the initial message" do
			initial_message = "Welcome to Forca game!"
			expect(ci).to receive(:write).with(initial_message)

			game.start
		end

		it "read the number of letter for to raffle a word" do
			expect(ci).to receive(:read)

			game.start
			game.next_step
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

				game.next_step
			end

			it "should print '____' for a word with length is 4" do
				word_length = "4"
				expected_word = "____"
				raffle_word = "ABCD"
				allow(ci).to receive(:read).and_return(word_length)
				allow(word_raffle).to receive(:raffle_word).with(word_length.to_i).and_return(raffle_word)
				allow(word_in_progress).to receive(:generate_word).with(raffle_word, []).and_return(expected_word)

				expect(ci).to receive(:write).with(expected_word)

				game.next_step
			end
		end

		context "when player ask to raffle word" do
			it "should return a word with the length passed" do
				word_length = "3"
				allow(ci).to receive(:read).and_return(word_length)
				allow(word_raffle).to receive(:raffle_word).with(word_length.to_i).and_return("mom")

				game.next_step
				returned_word_length = game.raffle_word.length

				expect(returned_word_length).to eq(word_length.to_i)
			end
		end

		context "when player guess a letter" do
			before do
				game.start
				allow(ci).to receive(:read).and_return("3")
				allow(word_raffle).to receive(:raffle_word).and_return("MOM")
				game.next_step
			end

			it "should replace underscore when the letter is avalible on the raffled word" do
				word = "M_M"
				allow(ci).to receive(:read).and_return("M")
				allow(word_in_progress).to receive(:generate_word).and_return(word)

				expect(ci).to receive(:write).with(word)

				game.next_step
			end

			it "should replace underscore when the letter is avalible on the raffled word ignoring letter case" do
				word = "M_M"
				allow(ci).to receive(:read).and_return("m")
				allow(word_in_progress).to receive(:generate_word).and_return(word)

				expect(ci).to receive(:write).with("M_M")

				game.next_step
			end

			it "should change nothing in word in progress and start doll draw on the first guess letter wrong" do
				draw =
												"----+\n" +
												"    |\n" +
												"    O"
				allow(ci).to receive(:read).and_return("X")
				allow(word_in_progress).to receive(:draw_doll).and_return(draw)

				expect(ci).to receive(:write).with(draw)

				game.next_step
			end
		end

		it "should not ask player for pass word length again" do
			game.start
			allow(ci).to receive(:read).and_return("3")

			expect(ci).to receive(:write).with("How the length of word for be raffled?")
			game.next_step

			expect(ci).to_not receive(:write).with("How the length of word for be raffled?")
			game.next_step
		end

		it "finish the game when the player asks to" do
			player_input = "finish"
			allow(ci).to receive(:read).and_return("finish")

			game.next_step

			expect(game).to be_ended
		end

		it "should return a message when the player pass the not avalible word length" do
			word_length = "20"
			message = "We don't have the word with this wish lenght, is necessary choose another length."
			allow(ci).to receive(:read).and_return(word_length)
			allow(word_raffle).to receive(:raffle_word).and_raise(StandardError, "We don't have the word with this wish lenght, is necessary choose another length.")
			game.start

			expect(ci).to receive(:write).with(message)

			game.next_step
		end
	end
end
