Feature: User can add movie by searching for it in The Movie Database (TMDb)

  As a movie fan
  I want to add movies by looking up their detail in TMDb
  So that I can add new movies without manual tedium

  Scenario: Try to add nonexistent movie (sad path)
    Given I am on the rottenPotatoes home page
    When I have attempted to add a non-existent movie "Search TMDb for a movie" from TMDb
    Then I should see "Search TMDb for a movie" was not found in TMDb."