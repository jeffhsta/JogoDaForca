class WordRaffle
	def raffle_word(word_length)
		words = %w(hi mom game fruit)
		raffled_word = words.detect do |word|
			word.length == word_length
		end

		puts "raffle_word: #{raffled_word}"
		validate_raffle_word raffled_word
		puts "Problemas"
	end

	private

	def validate_raffle_word(raffled_word)
		if raffled_word == nil
			raise StandardError, "We don't have the word with this wish lenght, is necessary choose another length."
		end

		raffled_word
	end
end