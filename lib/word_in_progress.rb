class WordInProgress
  def generate_word(raffle_word, words_right)
    word = ""

    raffle_word.split("").each do |letter|
    	word << get_letter_for_word_in_progress(words_right, letter)
    end

    word
  end

  def draw_doll(guess_wrong)
    doll_head =
                "----+\n" +
                "    |\n" +
                "    O\n"
    doll_arms = "   /|\\\n"

    if guess_wrong == 1
      doll_head
    elsif guess_wrong == 2
      doll_head + "   /|"
    elsif guess_wrong == 3
      doll_head + doll_arms
    elsif guess_wrong == 4
      doll_head + doll_arms + "   /"
    elsif guess_wrong == 5
      doll_head + doll_arms + "   / \\"
    end
  end

  private

  def get_letter_for_word_in_progress(words_right, letter)
    words_right.include?(letter) ? letter : "_"
  end
end
