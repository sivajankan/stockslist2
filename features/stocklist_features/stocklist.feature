Feature: As a regular user 
	I can create, read, update and delete a stocklist entry
	
Scenario: I can create new stock entry and see it in index page
	Given I am on the home page
	And I follow the "Stocklists" link
	Then I follow the "New Stocklist" link
	Then I have entered "QWER" into the "Symbol" field
	And I have entered "Qwerty Inc" into the "Name" field
	And I have entered "100B" into the "Marketcap" field 
	And I have selected "2001" from "Ipoyear" dropdown list
	And I have entered "Technology" into the "Sector" field
	And I have entered "Keyboard" into the "Industry" field
	When I press "Save" button
	Then I should see "Stocklist was successfully created"
	When I follow the "Back" button
	Then I should be in "Stocklist page"
	And I should see "QWER"
	And I should see "Qwerty Inc"
	And I should see "100B"
	And I should see "2001"
	And I should see "Technology"
	And I should see "Keyboard"
