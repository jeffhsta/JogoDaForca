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

	Scenario: I guess the first letter with failure
		I can see nothing changed in the word in progress
		I can see a start doll draw

		Given the game is started
		And the word length is "4"
		When I guess letter "X"
		And finish the game
		Then I look on screen:
		"""
		___
		----+
		    |
		    O
		"""

	Scenario: I guess the second letter with failure
		I can see nothing changed in the word in progress
		I can see a start doll draw

		Given the game is started
		And the word length is "4"
		When I guess letter "X"
		And I guess letter "Y"
		And finish the game
		Then I look on screen:
		"""
		___
		----+
		    |
		    O
		   /|
		"""

	# IN DEVELOPMENT
#	Scenario: I guess the third letter with failure
#		I can see nothing changed in the word in progress
#		I can see a start doll draw
#
#		Given the game is started
#		And the word length is "4"
#		When I guess letter "X"
#		And I guess letter "Y"
#		And finish the game
#		Then I look on screen:
#		"""
#		___
#		----+
#				|
#				O
#			 /|\
#		"""
