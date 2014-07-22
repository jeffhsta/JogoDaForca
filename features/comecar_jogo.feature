# language: en

Feature: start the game
	For can pass the time
	Like a player
	I want start a new game

	Scenario: Start new game with success
		Show the initial message to player when game start

		When start a new game
		Then I look on screen:
		"""
		Welcome to Forca game!
		"""

	# @wip
	# Scenario: raffle the word with success
	# 	After the player start the game, he/she must choose the word guess size.
	# 	After previous step, the game raffle the word and show on the screen "_" for each letter in raffled word

	# 	Given I started the game
	# 	When I choose the raffle word to have "4" letters
	# 	Then I look on screen:
	# 	"""
	# 	____
	# 	"""