require "spec_helper"
require "word_in_progress"
require "doll_draw"

describe WordInProgress do
  let(:doll_draw) { double "doll_draw" }
  subject(:word_in_progress) { WordInProgress.new doll_draw }

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

  describe "#draw_doll" do
    it "should draw just the doll's head with 1 guess wrong" do
      guess_wrong = 1
      given_draw =
              "----+\n" +
              "    |\n" +
              "    O\n"

      allow(doll_draw).to receive(:draw).with(guess_wrong).and_return(given_draw)
      draw = word_in_progress.draw_doll guess_wrong

      expect(draw).to eq(given_draw)
    end

    it "should draw add left arm on doll with 2 guess wrong" do
      guess_wrong = 2
      given_draw =
              "----+\n" +
              "    |\n" +
              "    O\n" +
              "   /|"

      allow(doll_draw).to receive(:draw).with(guess_wrong).and_return(given_draw)
      draw = word_in_progress.draw_doll guess_wrong

      expect(draw).to eq(given_draw)
    end

    it "should draw add left arm on doll with 3 guess wrong" do
      guess_wrong = 3
      given_draw =
              "----+\n" +
              "    |\n" +
              "    O\n" +
              "   /|\\\n"

      allow(doll_draw).to receive(:draw).with(guess_wrong).and_return(given_draw)
      draw = word_in_progress.draw_doll guess_wrong

      expect(draw).to eq(given_draw)
    end

    it "should draw add left arm on doll with 4 guess wrong" do
      guess_wrong = 4
      given_draw =
              "----+\n" +
              "    |\n" +
              "    O\n" +
              "   /|\\\n" +
              "   /"

      allow(doll_draw).to receive(:draw).with(guess_wrong).and_return(given_draw)
      draw = word_in_progress.draw_doll guess_wrong

      expect(draw).to eq(given_draw)
    end

    it "should draw add left arm on doll with 5 guess wrong" do
      guess_wrong = 5
      given_draw =
              "----+\n" +
              "    |\n" +
              "    O\n" +
              "   /|\\\n" +
              "   / \\"

      allow(doll_draw).to receive(:draw).with(guess_wrong).and_return(given_draw)
      draw = word_in_progress.draw_doll guess_wrong

      expect(draw).to eq(given_draw)
    end
  end
end
