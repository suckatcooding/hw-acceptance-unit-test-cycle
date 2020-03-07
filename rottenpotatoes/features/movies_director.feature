Feature: search for movies by director

  As a movie buff
  So that I can find movies with my favorite director
  I want to include and serach on director information in movies I enter

Background: movies in database

  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |
  | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
  | Alien        | R      |              |   1979-05-25 |
  | THX-1138     | R      | George Lucas |   1971-03-11 |

Scenario: add director to existing movie
  When I go to the edit page for "Alien"
  And  I fill in "Director" with "Ridley Scott"
  And  I press "Update Movie Info"
  Then the director of "Alien" should be "Ridley Scott"

Scenario: find movie with same director
  Given I am on the details page for "Star Wars"
  When  I follow "Find Movies With Same Director"
  Then  I should be on the Similar Movies page for "Star Wars"
  And   I should see "THX-1138"
  But   I should not see "Blade Runner"

Scenario: can't find similar movies if we don't know director (sad path)
  Given I am on the details page for "Alien"
  Then  I should not see "Ridley Scott"
  When  I follow "Find Movies With Same Director"
  Then  I should be on the home page
  And   I should see "'Alien' has no director info"
  
Scenario: remove a movie
  Given I am on the home page
  When  I follow "More about Blade Runner"
  And   I press "Delete"
  Then  I should see "Movie 'Blade Runner' deleted."
  And   I should not see "More about Blade Runner"
  
Scenario: add new movies
  When I go to the new movie page
  And  I fill in "Title" with "Fengqiao Wang the Chinese"
  And  I fill in "Director" with "GoodMan"
  And  I select "R" from "Rating"
  And  I press "Save Changes"
  Then I should see "Fengqiao Wang the Chinese"
  And  I should see "GoodMan"

Scenario: view details about a movie
  Given I am on the home page
  When  I follow "More about THX-1138"
  Then  I should see "Details about THX-1138"
  And   I should see "Director: George Lucas"
