Feature: As a regular user 
	I can create, read, update and delete a stocklist entry
	
Scenario: I can create new stock entry and see it in index page 
	Given I am on the home page
	And I follow the "Stocklists" link
	Then I follow the "New" link
	Then I have entered "QWER" into the "Symbol" field
	And I have entered "Qwerty Inc" into the "Name" field
	And I have selected "1982" from "Ipoyear" dropdown list
	And I have entered "100B" into the "Marketcap" field 
	#And I have selected "2001" from "Ipoyear" dropdown list
	And I have entered "Technology" into the "Sector" field
	And I have entered "Keyboard" into the "Industry" field
	When I click the "Save" button
	Then I should see "Stocklist was successfully created"
	#When I click the "Back" button
	#Then I should be in "Stocklist page"
	And I should see "QWER"
	And I should see "Qwerty Inc"
	And I should see "1982"
	And I should see "100B"
	#And I should see "2001"
	And I should see "Technology"
	And I should see "Keyboard"

@selenium
Scenario: I can create new stock entry and see it in index page 
  Given I am on the home page
  And I follow the "Stocklists" link
  Then I follow the "New" link
  Then I have entered "A" into the "Symbol" field
  When I click the "Save" button
  Then I should see "Stocklist was successfully created"
  And I wait until all Ajax requests are complete
  And I should see "Last Trade"
  And I should see "200D Mov Avg Chg"

Scenario: I can update the stock entry
	Given there is a stock entry
	And I am on the stocklist page
	When I click on "edit" icon in the first stock
	Then I have entered "Tech1" into the "Sector" field
	And I have selected "1991" from "Ipoyear" dropdown list
	When I click the "Save" button
	Then I should see "Stocklist was successfully updated."
	And I should see "A1"
	And I should see "A1 Inc"
	And I should see "Tech1"
	And I should see "1991"
	
@selenium
Scenario: I can delete unwanted stock entry
	Given there is a stock entry
	And I am on the stocklist page
	When I click on "remove" icon in the first stock 
  And I confirm the dialog
  Then I should see no stock entry listed
    