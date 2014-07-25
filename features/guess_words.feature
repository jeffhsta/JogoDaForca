# language: en

Feature: game started
	For can play the game
	Like a player
	I want guess a letter

	Scenario: I guess the letter successifully
		I can see this letter in right position replacing underscore

		Given the game is started
		And the word length is "3"
		When I guess letter "M"
		And finish the game
		Then I look on screen:
		"""
		M_M
		"""
