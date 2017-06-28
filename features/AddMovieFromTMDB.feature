Feature: User can add movie by searching for it in The Movie Database (TMDb)

  As a movie fan
  I want to add movies by looking up their detail in TMDb
  So that I can add new movies without manual tedium

  Background: Start from the Search from on the home page
    Given I am on the rottenPotatoes home page
    Then I should see "Search TMDb for a movie"

  Scenario: Try to add nonexistent movie (sad path)
    When I have attempted to add a non-existent movie "Movie That Does Not Exist" from TMDb
    Then I should see "Movie That Does Not Exist" was not found in TMDb."