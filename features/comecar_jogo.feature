# language: en

Feature: start the game
	For can pass the time
	Like a player
	I want start a new game

	Scenario: Start new game with success
		Show the initial message to player when game start

		When start a new game
		And finish the game
		Then I look on screen:
		"""
		Welcome to Forca game!
		"""

	Scenario: raffle the word with success
		After the player start the game, he/she must choose the word guess size.
		After previous step, the game raffle the word and show on the screen "_" for each letter in raffled word

		Given I started the game
		When I choose the raffle word to have "4" letters
		And finish the game
		Then I look on screen:
		"""
		____
		"""

	Scenario: raffle the word without success
		If the player choose the word length not valiable, the player will be alerted
		about that and he/she need choose another word length

		Given I started the game
		When I choose the raffle word to have "20" letters
		And finish the game
		Then the game finish with the message on the screen:
		"""
		We don't have the word with this wish lenght, is necessary choose another length.
		How the length of word for be raffled?
		"""
