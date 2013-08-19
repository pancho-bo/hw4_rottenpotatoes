Feature: Add a movie
 
  As site editor
  So that I can manage site movie collection
  I want be able to add movies

Background: movies have been added to database
  
  Given the following movies exist:
  | title                   | rating | release_date |
  | The Terminator          | R      | 26-Oct-1984  |
  | When Harry Met Sally    | R      | 21-Jul-1989  |

  And I am on the add new movie page

Scenario: Add a movie
  When I fill in "Title" with "The Help"
  And  I select "G" from "Rating"
  And  I press "Save Changes"
  Then I should be on the home page
  And I should see "The Help was successfully created."

