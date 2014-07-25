require "spec_helper"
require "word_in_progress"

describe WordInProgress do
  subject(:word_in_progress) { WordInProgress.new }

  describe "#generate_word" do
    it "should replace underscore for letter when it is right" do
      raffle_word = "MOM"
      words_right = ["M"]

      word = word_in_progress.generate_word raffle_word, words_right

      expect(word).to eq("M_M")
    end

    it "should replace underscore for one or more letters when it is right" do
      raffle_word = "FRUIT"
      words_right = ["F", "I"]

      word = word_in_progress.generate_word raffle_word, words_right

      expect(word).to eq("F__I_")
    end

    it "shoud return just underscores with quantity equal the word length when words_right is []" do
      raffle_word = "FRUIT"
      words_right = []

      word = word_in_progress.generate_word raffle_word, words_right

      expect(word).to eq("_____")
    end
  end
end
