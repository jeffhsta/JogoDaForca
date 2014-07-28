require "spec_helper"
require "doll_draw"

describe DollDraw do
  subject(:doll_draw) { DollDraw.new }

  describe "#draw" do
    xit "should draw nothing when pass nil" do
      parts = nill
      expected_draw = ""

      draw = doll_draw.draw parts

      expect(draw).to eq(expected_draw)
    end

    it "should draw just the doll's head with 1 part" do
      parts = 1
      expected_draw =
              "----+\n" +
              "    |\n" +
              "    O\n"

      draw = doll_draw.draw parts

      expect(draw).to eq(expected_draw)
    end

    it "should draw add left arm on doll with 2 parts" do
      parts = 2
      expected_draw =
              "----+\n" +
              "    |\n" +
              "    O\n" +
              "   /|"

      draw = doll_draw.draw parts

      expect(draw).to eq(expected_draw)
    end

    it "should draw add left arm on doll with 3 parts" do
      parts = 3
      expected_draw =
              "----+\n" +
              "    |\n" +
              "    O\n" +
              "   /|\\\n"

      draw = doll_draw.draw parts

      expect(draw).to eq(expected_draw)
    end

    it "should draw add left arm on doll with 4 parts" do
      parts = 4
      expected_draw =
              "----+\n" +
              "    |\n" +
              "    O\n" +
              "   /|\\\n" +
              "   /"

      draw = doll_draw.draw parts

      expect(draw).to eq(expected_draw)
    end

    it "should draw add left arm on doll with 5 parts" do
      parts = 5
      expected_draw =
              "----+\n" +
              "    |\n" +
              "    O\n" +
              "   /|\\\n" +
              "   / \\"

      draw = doll_draw.draw parts

      expect(draw).to eq(expected_draw)
    end
  end
end
