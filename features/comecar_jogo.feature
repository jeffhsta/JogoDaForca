# language: en

Feature: start the game
	For can pass the time
	Like a player
	I want start a new game

	Scenario: Start new game with success
		Show the initial message to player when game start

		When start a new game
		Then look on screen:
		"""
		Welcome to Forca game!
		"""