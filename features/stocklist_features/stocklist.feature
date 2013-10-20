@selenium
Feature: As a regular user 
	I can create, read, update and delete a stocklist entry

Background: Login with valid credentials
 Given I exist as a user
   And I sign in with admin credentials

Scenario: I can create new stock entry and see it in index page 
	Given I am on the home page
	And I follow the "Stocklists" link
	Then I click the "Add" button
	Then I have entered "QWER" into the "Symbol" field inside new stocklist container
	And I have entered "Qwerty Inc" into the "Name" field inside new stocklist container
	And I have entered "1982" into the "IPO-Year" field inside new stocklist container
	And I have entered "Technology" into the "Sector" field inside new stocklist container
	And I have entered "Keyboard" into the "Industry" field inside new stocklist container
	When I click the "Save" button inside new stocklist container
	Then I click on "QWER" stocklist entry inside list stocklist container
	And I should see "QWER" inside view stocklist container
	And I should see "Qwerty Inc" inside view stocklist container
	And I should see "1982" inside view stocklist container
	And I should see "Technology" inside view stocklist container
	And I should see "Keyboard" inside view stocklist container

@wip
Scenario: I can create new stock entry and see it in index page 
  Given I am on the home page
  And I follow the "Stocklists" link
  Then I click the "Add" button
  Then I have entered "A" into the "Symbol" field inside new stocklist container  
  When I click the "Save" button inside new stocklist container
  Then I should see "A"
  And I should see "Last Trade"
  And I should see "200D Mov Avg Chg"

#capybara is not ready to test content editable
@wip
Scenario: I can update the stock entry
	Given there is a stock entry
	And I am on the stocklist page
  Then I click on "A1" stocklist entry inside list stocklist container	
	#When I click on "edit" icon in the first stock
	Then I have entered "Tech1" into the "Sector" field inside view stocklist container
	And I have entered "1991" into the "IPO-Year" field inside new stocklist container
	#And I have selected "1991" from "Ipoyear" dropdown list
	When I click the "Update" button
	Then I click on "A1" stocklist entry inside list stocklist container
	And I should see "A1" inside view stocklist container
	And I should see "A1 Inc" inside view stocklist container
	And I should see "Tech1" inside view stocklist container
	And I should see "1991" inside view stocklist container
	
Scenario: I can delete unwanted stock entry
	Given there is a stock entry
	And I am on the stocklist page
	Then I click on "A1" stocklist entry inside list stocklist container
	When I click the "Delete" button inside view stocklist container
  And I confirm the dialog
  Then I should see no stock entry listed inside list stocklist container
    