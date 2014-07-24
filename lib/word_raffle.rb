class WordRaffle
	def raffle_word(word_length)
		words = %w(hi mom game fruit)
		raffled_word = words.detect do |word|
			word.length == word_length
		end

		validate_raffle_word raffled_word
	end

	private

	def validate_raffle_word(raffled_word)
		if raffled_word == nil
			raise StandardError, "We don't have the word with this wish lenght, is necessary choose another length."
		end

		raffled_word
	end
end