# language: en

Feature: finish the game
  For can play a game
  Like a player
  I can complete the word or guess wrong 6 times

  Scenario: I complete the word
    I can see congratulation message

    Given the game is started
    And the word length is "3"
    When I guess letter "M"
    And I guess letter "O"
    Then I look on screen:
    """
    Congratulations, you win the Forca game!!!
    """
