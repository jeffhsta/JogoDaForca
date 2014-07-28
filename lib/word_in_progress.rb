require_relative "doll_draw"

class WordInProgress
  def initialize(doll_draw = DollDraw.new)
    @doll_draw = doll_draw
  end

  def generate_word(raffle_word, words_right)
    word = ""

    raffle_word.split("").each do |letter|
    	word << get_letter_for_word_in_progress(words_right, letter)
    end

    word
  end

  def draw_doll(guess_wrong)
    @doll_draw.draw guess_wrong
  end

  private

  def get_letter_for_word_in_progress(words_right, letter)
    words_right.include?(letter) ? letter : "_"
  end
end
