Feature:  Remove a movie
 
  As site editor
  So that I can manage site movie collection
  I want be able to remove movies

Background: movies have been added to database
  
  Given the following movies exist:
  | title                   | rating | release_date |
  | Aladdin                 | G      | 25-Nov-1992  |
  | The Terminator          | R      | 26-Oct-1984  |
  | When Harry Met Sally    | R      | 21-Jul-1989  |

  And I am on the details page for "Aladdin"

Scenario: Add a movie
  And  I press "Delete"
  Then I should be on the home page
  And I should see "Movie 'Aladdin' deleted."

