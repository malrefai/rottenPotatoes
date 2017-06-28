Feature: User can manually add movie

  Scenario: Add a movie
    Given |I am on the rottenPotatoes home page
    When |I follow "Add new movie"
    Then |I should be on the Create New Movie page
    When |I fill in "Title" with "Men in Black"
    And |I select "PG-13" from "Rating"
    And |I press "Save Changes"
    Then |I should be on the rottenPotatoes home page
    And |I should see "Men in Black"