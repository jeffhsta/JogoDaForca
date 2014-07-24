require "spec_helper"
require "word_raffle"

describe WordRaffle do
	subject(:word_raffle) { WordRaffle.new }

	describe "#raffle_word" do
		it "should return a raffle word when pass avaliable word length" do
			word_length = 2

			raffled_word = word_raffle.raffle_word word_length

			expect(raffled_word.length).to eq(word_length)
		end

		it "should throw a exeption when passa not avaliable word length" do
			not_availaible_word_length = 20

			expect {
				word_raffle.raffle_word not_availaible_word_length
			}.to raise_error(StandardError, "We don't have the word with this wish lenght, is necessary choose another length.")
		end
	end
end