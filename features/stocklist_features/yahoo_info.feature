Feature:
  I can see all details of given stock

@selenium
Scenario: I can create new stock entry and see it in index page 
  Given I am on the home page
  And I follow the "YahooInfo" link
  When I have entered "AAPL" into the "Symbol" field
  And I follow the "Fetch Data" link
  And I wait 2 seconds
  Then I should see "Last Trade"
