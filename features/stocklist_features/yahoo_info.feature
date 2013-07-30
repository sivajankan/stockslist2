@selenium
Feature:
  I can see all details of given stock in yahoo info page
  
Background: opening yahoo info page
  Given I am on the home page
  And I follow the "YahooInfo" link
  When I have entered "AAPL" into the "Symbol" field
  And I follow the "Fetch Data" link
  And I wait 2 seconds
  Then I should see "Last Trade"

Scenario: I can create new stock entry and see it in index page 
  And I should see google stock graph image of "AAPL"
  When I click on the google stock graph image
  Then I should see google stock graph image of "AAPL" inside the fancy box
  When I click the "closebox.png" image inside the fancy box
  And I wait 1 second
  Then I should not see the fancy box
  
Scenario: I can see google graphs is changing as per the period selection
  And I should see google stock graph image of "AAPL"
  Then I can verify google stock graph image updated based on period selection:
    | 3d      |
    | 5d      |
    | 1M      |
    | 3M      |
    | 6M      |
    | 1Y      |
    | 2Y      |
    | 5Y      |
    | max     |

Scenario: I can see google graphs in fancy box is changing as per the period selection
  And I should see google stock graph image of "AAPL"
  When I click on the google stock graph image
  Then I should see google stock graph image of "AAPL" inside the fancy box
  Then I can verify google stock graph image updated based on period selection inside the fancy box:
    | 3d      |
    | 5d      |
    | 1M      |
    | 3M      |
    | 6M      |
    | 1Y      |
    | 2Y      |
    | 5Y      |
    | max     |
