Feature: User can add movie by searching for it in The Movie Database (TMDb)

  As a movie fan
  I want to add movies by looking up their detail in TMDb
  So that I can add new movies without manual tedium

  Scenario: Try to add nonexistent movie (sad path)
    Given | I am on the rottenPotatoes home page
    Then | I should see "Search TMDb for a movie"
    When | I fill in "Search Terms" with "Movie That Does Not Exist"
    And | I press "Search TBDb"
    Then | I should be on the rottenPotatoes home page
    And | I should see "'Movie That Does Not Exist' was not found in TMDb."